class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :mfl_id
      t.decimal :salary
      t.integer :contract_length
      t.references :roster, index: true, foreign_key: true


      t.timestamps null: false
    end
  end
end
