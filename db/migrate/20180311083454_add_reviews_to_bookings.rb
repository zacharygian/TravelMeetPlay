class AddReviewsToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :rating, :integer, default: 0
    add_column :bookings, :review_content, :string
  end
end
