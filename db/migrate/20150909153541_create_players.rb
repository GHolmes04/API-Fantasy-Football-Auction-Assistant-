class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :mfl_id
      t.string :team
      t.string :position
      t.decimal :salary
      t.integer :contract_length

      t.timestamps null: false
    end
  end
end
