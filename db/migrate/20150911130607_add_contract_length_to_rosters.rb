class AddContractLengthToRosters < ActiveRecord::Migration
  def change
    add_column :rosters, :contractLength, :integer
  end
end
