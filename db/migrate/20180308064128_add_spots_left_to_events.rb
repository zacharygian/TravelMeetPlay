class AddSpotsLeftToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :spots_left, :integer
  end
end
