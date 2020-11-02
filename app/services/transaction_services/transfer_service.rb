module TransactionServices
  class TransferService
    def initialize(params)
      @account_transaction  = params[:transaction_params][:account_transaction]
      @account = params[:transaction_params][:account]  
      @current_user = params[:transaction_params][:current_user]  
    end

    def execute
          newBalance = @account.balance - @account_transaction.amount 
          @account.update_attribute(:balance, newBalance)
          newBalance2 = @current_user.accounts.first.balance + @account_transaction.amount 
          @current_user.accounts.first.update_attribute(:balance, newBalance2)
    end
    
  end
end