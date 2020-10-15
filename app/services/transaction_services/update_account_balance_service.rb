module TransactionServices
  class UpdateAccountBalanceService 
    def initialize(params)
      puts "yeah! I reached to service"
      @account_transaction  = params[:transaction_params][:account_transaction]
      @account = params[:transaction_params][:account]
    end

    def execute
      newBalance = @account_transaction.amount + @account.balance
      @account.update_attribute(:balance, newBalance)
    end

  end
end