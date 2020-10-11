json.extract! account, :id, :name, :balance, :status, :parent_id, :created_at, :updated_at
json.url account_url(account, format: :json)
