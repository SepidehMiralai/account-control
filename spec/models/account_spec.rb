# require 'rails_helper'

# RSpec.describe Account, type: :model do
#   describe "creation" do
#     before do 
#       @account = Account.create(name: "account1", balance: 200, status: "active", accountable_type: "Person", accountable_id: "1" )
#     end

#     it "can create an account" do    
#       expect(@account).to be_valid
#     end

#     it "cannot create an account without a name" do
#       @account.name = nil
#       expect(@account).to_not be_valid
#     end

#     it "cannot create an account without a balance" do
#       @account.balance = nil
#       expect(@account).to_not be_valid
#     end

#     it "cannot create an account without a status" do
#       @account.status = nil
#       expect(@account).to_not be_valid
#     end

#   end
# end