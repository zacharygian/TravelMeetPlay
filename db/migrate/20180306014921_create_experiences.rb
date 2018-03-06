class CreateExperiences < ActiveRecord::Migration[5.1]
  def change
    create_table :experiences do |t|
      t.references :user, foreign_key: true
      t.references :sport, foreign_key: true
      t.integer :skill_level
      t.integer :game_counter
      t.integer :win_counter

      t.timestamps
    end
  end
end
