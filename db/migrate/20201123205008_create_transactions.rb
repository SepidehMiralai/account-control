class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :type
      t.integer :sender_id
      t.integer :receiver_id
      t.string :number
      t.integer :amount

      t.timestamps
    end
  end
end
