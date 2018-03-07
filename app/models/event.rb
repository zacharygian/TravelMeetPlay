class Event < ApplicationRecord
  belongs_to :sport
  belongs_to :host, class_name: "User"

  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy

  def nice_date
    date.strftime("%b %d, %Y") if date
  end
end
