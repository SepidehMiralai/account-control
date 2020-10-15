module Accounts
  class PerformTransaction
      def initialize(amount: , transaction_type: , account_id: )
          @amount = amount.to_f
          @transaction_type = transaction_type
          @account_id = account_id
          @account = Account.where(id: @account_id).first
      end

      def execute!()
          ActiveRecord::Base.transaction do
              AccountTransaction.create!(
                  account: @account,
                  amount: @amount,
                  transaction_type: @transaction_type
              )

              if @transaction_type == "withdraw"
                  @account.update!(balance: @account.balance.to_f - @amount)
              elsif @transaction_type == "deposit" 
                  @account.update!(balance: @account.balance.to_f + @amount)
              end
          end
          
          @account
      end

      private

  end
end