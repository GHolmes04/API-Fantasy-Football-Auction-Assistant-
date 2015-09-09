class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.integer :mfl_id
      t.string :name, null: false
      t.decimal :salary_cap, :scale => 2, :precision => 6
      t.integer :roster_spots
      t.integer :num_of_teams, null: false

      t.timestamps null: false
    end
  end
end
