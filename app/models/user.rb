class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

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

end
