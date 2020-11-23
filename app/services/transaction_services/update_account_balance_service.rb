module TransactionServices
  class UpdateAccountBalanceService
    def initialize(params)
      @transaction  = params[:transaction_params][:transaction]
      @account = params[:transaction_params][:account]
    end

    def execute
      newBalance = @transaction.amount + @account.balance
      @account.update_attribute(:balance, newBalance)
    end

  end
end
