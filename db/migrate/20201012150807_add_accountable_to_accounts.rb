class AddAccountableToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_reference :accounts, :accountable, polymorphic: true, null: false
  end
end
