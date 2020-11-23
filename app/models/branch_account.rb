class BranchAccount < Account
  belongs_to :parent, class_name: "Account", optional: true

  validates :parent, presence: true

  def has_parent?
    true
  end

  def parent_name
    parent.name
  end
end
