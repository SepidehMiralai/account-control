class Transaction < ApplicationRecord
  belongs_to :receiver, class_name: 'Account'

  validates :amount, presence: true, numericality: true

  def amount_in_dollars
    amount / 100.0
  end
end
