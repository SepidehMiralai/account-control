# class Account < ApplicationRecord
#   belongs_to :parent, class_name: "Account", optional: true
#   has_many :children, class_name: "Account", foreign_key: "parent_id"
#   belongs_to :accountable, polymorphic: true
#   has_many :account_transactions
#
#   validates :name, presence: true, uniqueness: true
#   validates :balance, presence: true, numericality: true
#   validates :status, presence: true
#
#
#   def parent_name
#     # it may not have a parent
#     parent.try(:name)
#   end
#
#   def has_parent?
#     parent.present?
#   end
#
#   def has_children?
#     children.exists?
#   end
#
# end

class Account < ApplicationRecord
  has_many :children, class_name: "BranchAccount", foreign_key: "parent_id"
  belongs_to :accountable, polymorphic: true
  has_many :account_transactions

  has_many :received_transactions, foreign_key: :receiver_id, class_name: "Transaction"
  has_many :sent_transactions, foreign_key: :sender_id, class_name: "Transaction"

  validates :name, presence: true, uniqueness: true
  validates :balance, presence: true, numericality: true
  validates :status, presence: true

  def parent_name
    nil
  end

  def has_parent?
    false
  end

  def has_children?
    children.exists?
  end

  def transactions
    received_transactions + sent_transactions
  end

  def balance
    received_transactions.sum(:amount) - sent_transactions.sum(:amount)
  end

  def balance_in_dollars
    balance / 100
  end

  def other_accounts
    accountable.accounts - [self]
  end
end
