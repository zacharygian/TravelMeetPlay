class ChangeLocationToAddressInEvents < ActiveRecord::Migration[5.1]
  def change
    rename_column :events, :location, :address
  end
end
