class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :name
      t.decimal :balance
      t.integer :status
      t.integer :parent_id

      t.timestamps
    end
  end
end
