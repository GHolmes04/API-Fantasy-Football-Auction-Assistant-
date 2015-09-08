class CreateFranchises < ActiveRecord::Migration
  def change
    create_table :franchises do |t|
      t.references :user, index: true, foreign_key: true
      t.references :league, index: true, foreign_key: true
      t.string :name, null: false


      t.timestamps null: false
    end
  end
end
