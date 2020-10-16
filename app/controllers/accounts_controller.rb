class AccountsController < ApplicationController
  before_action :set_accountable
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  
  # GET /accounts
  # GET /accounts.json
  
  # GET /accounts/1
  # GET /accounts/1.json
  def index
    @accounts = @accountable.accounts
  end

  def show
  end

  # GET /accounts/new
   def new
    @account = @accountable.accounts.new
  end

  # GET /accounts/1/edit
  def edit
    
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = @accountable.accounts.new account_params
    @account.accountable_id = @current_user.id
    @account.accountable_type = @type

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @accounts = @accountable.accounts
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = @accountable.accounts.find(params[:id])
    end

    def set_accountable
      if (legal_person_signed_in?)
        # @accountable = LegalPerson.find(params[:legal_person_id]) 
        @accountable = current_legal_person
        @type = "LegalPerson"
      elsif (person_signed_in?)
        # @accountable = Person.find(params[:person_id]) 
        @accountable = current_person
        @type = "Person"
      end
    end
    
    # Only allow a list of trusted parameters through.
    def account_params
      params.require(:account).permit(:name, :balance, :status, :parent_id, :accountable_id, :accountable_type)
    end

end
