class RemoveStatusFromAccounts < ActiveRecord::Migration[6.0]
  def change
    remove_column :accounts, :status, :integer
  end
end
