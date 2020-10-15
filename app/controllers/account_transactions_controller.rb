class AccountTransactionsController < ApplicationController
  include Devise::Controllers::Helpers 
  before_action :set_account_transaction, only: [:show, :edit, :update, :destroy]
  before_action :set_account, only: [:new, :index, :create, :destroy]

  # GET /account_transactions
  # GET /account_transactions.json
  def index
    @account_transactions = @account.account_transactions
  end

  # GET /account_transactions/1
  # GET /account_transactions/1.json
  def show
  end

  # GET /account_transactions/new
  def new
    @account_transaction = AccountTransaction.new
  end

  # GET /account_transactions/1/edit
  def edit
  end

  # POST /account_transactions
  # POST /account_transactions.json
  def create
    @account_transaction = AccountTransaction.new(account_transaction_params)
    @account_transaction.account_id = @account.id

    respond_to do |format|
      if @account_transaction.save
        format.html { redirect_to @account_transaction, notice: 'Account transaction was successfully created.' }
        format.json { render :show, status: :created, location: @account_transaction }
        if (@account_transaction.transaction_type == "deposit" && @account.has_parent? && @account.status=="active") ||
           (@account_transaction.transaction_type == "contribute" && !@account.has_parent?)
          # update_balance
          TransactionServices::UpdateAccountBalanceService.new({
          transaction_params: {
            account_transaction: @account_transaction,
            account: @account
          }
        }).execute
        end

        if (@account_transaction.transaction_type == "transfer")
          
        end
      else
        format.html { render :new }
        format.json { render json: @account_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account_transactions/1
  # PATCH/PUT /account_transactions/1.json
  def update
    respond_to do |format|
      if @account_transaction.update(account_transaction_params)
        format.html { redirect_to @account_transaction, notice: 'Account transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @account_transaction }
      else
        format.html { render :edit }
        format.json { render json: @account_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account_transactions/1
  # DELETE /account_transactions/1.json
  def destroy
    @account_transactions = @account.account_transactions
    @account_transaction.destroy
    respond_to do |format|
      format.html { redirect_to @account_transactions, notice: 'Account transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account_transaction
      @account_transaction = AccountTransaction.find(params[:id])
    end

    def set_account
      @account = Account.find(params[:account_id])
    end

    # Only allow a list of trusted parameters through.
    def account_transaction_params
      params.require(:account_transaction).permit(:amount, :transaction_type, :transaction_number, :account_id)
    end

    # def update_balance
    #   newBalance = @account_transaction.amount + @account.balance
    #   @account.update_attribute(:balance, newBalance)
    # end

end
