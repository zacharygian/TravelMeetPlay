class User < ApplicationRecord
  after_create :send_welcome_email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  has_many :events, foreign_key: "host_id"
  has_many :bookings
  has_many :reviews
  has_many :experiences
  mount_uploader :photo, PhotoUploader
  has_many :sports, through: :experiences

  validates :first_name, presence: true, on: :create

  def country_name
    if country
    country_string = ISO3166::Country[country]
    country_string.translations[I18n.locale.to_s] || country.name
    end
  end

  def conversation_with(another_user)
    if conversation = Conversation.between(id, another_user.id).first
      return conversation
    else
      return Conversation.create!(recipient_id: another_user.id, sender_id: id)
    end
  end

  def self.find_for_facebook_oauth(auth)
    # binding.pry
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    unless user_params[:first_name] && user_params[:last_name]
      user_params[:first_name], user_params[:last_name] = auth.info[:name].split
    end
    # binding.pry
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:remote_photo_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.

    if user
      user.update(user_params)
    else
      unless user_params[:email]
        user_params[:email] = auth[:uid] + "@tmp-facebook.com"
      end
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

  private
  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end

end
