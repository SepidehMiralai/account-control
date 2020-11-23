json.extract! account_transaction, :id, :amount, :transaction_type, :transaction_number, :account_id, :created_at, :updated_at
json.url account_transaction_url(account_transaction, format: :json)
