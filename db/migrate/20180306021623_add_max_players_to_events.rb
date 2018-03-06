class AddMaxPlayersToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :max_players, :integer
  end
end
