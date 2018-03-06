class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.string :score
      t.integer :rating
      t.text :review_content

      t.timestamps
    end
  end
end
