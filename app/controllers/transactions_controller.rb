require './App/services/transaction_services/update_account_balance_service.rb'
require './App/services/transaction_services/transfer_service.rb'

class TransactionsController < ApplicationController
  include Devise::Controllers::Helpers
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  before_action :set_account, only: [:new, :index, :create, :destroy]

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = @account.transactions
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.amount *= 100 if @transaction.amount
    @transaction.receiver_id = @account.id

    if (@transaction.is_a?(Transfer))
      @transaction.sender_id = @account.id
      @transaction.receiver_id = transaction_params[:receiver_id]
    end

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to transaction_path(@transaction), notice: 'Account transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
        #   TransactionServices::UpdateAccountBalanceService.new({
        #   transaction_params: {
        #     transaction: @transaction,
        #     account: @account
        #   }
        # }).execute

        # if (@transaction.is_a?(Transfer))
        #   @transaction.sender_id = @account.id
        #   @transaction.receiver_id = transaction_params[:receiver_id]
        #   if (@account.balance >= @transaction.amount )
        #     TransactionServices::TransferService.new({
        #     transaction_params: {
        #       transaction: @transaction,
        #       account: @account,
        #       current_user: @current_user
        #     }
        #   }).execute
        #   else
        #     flash[:error] = "transfer is not possible because transfer amount is more than account balance!"
        #   end
        # end
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to transaction_path(@transaction), notice: 'Account transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transactions = @account.transactions
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transaction_path(@transactions), notice: 'Account transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    def set_account
      @account = Account.find(params[:account_id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:amount, :type, :number, :receiver_id)
    end
end
