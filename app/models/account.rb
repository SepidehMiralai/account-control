class Account < ApplicationRecord
  belongs_to :parent, class_name: "Account", optional: true
  has_many :children, class_name: "Account", foreign_key: "parent_id"
  belongs_to :accountable, polymorphic: true
  has_many :account_transactions

  validates :name, presence: true, uniqueness: true
  validates :balance, presence: true, numericality: true


  def parent_name
    # it may not have a parent
    parent.try(:name)
  end
  
  def has_parent?
    parent.present?
  end
  
  def has_children?
    children.exists?
  end
end
