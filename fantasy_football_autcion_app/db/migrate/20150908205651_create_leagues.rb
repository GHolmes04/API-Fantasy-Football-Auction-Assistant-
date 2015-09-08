class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.integer :mfl_id
      t.string :name
      t.decimal :salary_cap
      t.integer :roster_spots
      t.integer :num_of_teams

      t.timestamps null: false
    end
  end
end
