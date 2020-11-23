class Transfer < Transaction
  belongs_to :sender, class_name: 'Account'

  # …
end


# Deposit.create!(
#   receiver: Account.first,
#   amount: 20000,
#   number: "4FFR4"
# )
#
# Transfer.create!(
#   sender: Account.first,
#   receiver: BranchAccount.first,
#   amount: 200,
#   number: "4DFR4"
# )
#
#
#
# BranchAccount.first
