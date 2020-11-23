class Deposit < Transaction
  validate :check_eligibility

  def check_eligibility
    errors.add :receiver, "You can only deposit money into an active Branch Account" unless receiver.is_a?(BranchAccount) && receiver.status == "active"
  end
end
