
class AccountTransaction < ApplicationRecord
  belongs_to :account

  validates :amount, presence: true, numericality: true
  validates :transaction_number, presence: true, uniqueness: true
  validates :transaction_type, presence: true

  
end
