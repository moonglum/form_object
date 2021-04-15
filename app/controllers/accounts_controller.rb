class AccountsController < ApplicationController
  # GET /accounts
  def index
    @accounts = Account.all
  end

  # GET /accounts/1
  def show
    @account = Account.find(params[:id])
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
    @account = AuditedAccount.new(Account.find(params[:id]))
  end

  # POST /accounts
  def create
    @account = AuditedAccount.new

    if @account.create(account_params)
      redirect_to @account, notice: 'Account was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /accounts/1
  def update
    @account = AuditedAccount.new(Account.find(params[:id]))

    if @account.update(account_params)
      redirect_to @account, notice: 'Account was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /accounts/1
  def destroy
    AuditedAccount.new(Account.find(params[:id])).destroy
    redirect_to accounts_url, notice: 'Account was successfully destroyed.'
  end

  private

    # Only allow a list of trusted parameters through.
    def account_params
      params.require(:account).permit(:name)
    end
end
