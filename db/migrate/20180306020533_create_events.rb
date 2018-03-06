class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.references :sport, foreign_key: true
      t.string :location
      t.datetime :date
      t.string :status
      t.references :host

      t.timestamps
    end
  end
end
