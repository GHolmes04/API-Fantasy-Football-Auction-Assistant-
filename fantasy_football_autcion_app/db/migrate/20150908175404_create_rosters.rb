class CreateRosters < ActiveRecord::Migration
  def change
    create_table :rosters do |t|
      t.references :franchise, index: true, foreign_key: true,
      t.references :league, index: true, foreign_key: true



      t.timestamps null: false
    end
  end
end
