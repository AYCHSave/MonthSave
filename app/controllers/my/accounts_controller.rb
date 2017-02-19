class My::AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  # GET /my/accounts
  def index
    @accounts = current_user.accounts.all
  end

  # GET /my/accounts/1
  def show
  end

  # GET /my/accounts/new
  def new
    @account = current_user.accounts.new
  end

  # GET /my/accounts/1/edit
  def edit
  end

  # POST /my/accounts
  def create
    @account = current_user.accounts.new(account_params)

    if @account.save
      redirect_to my_accounts_path, notice: 'Account was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /my/accounts/1
  def update
    if @account.update(account_params)
      redirect_to my_accounts_path, notice: 'Account was successfully updated.'
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = current_user.accounts.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def account_params
      params.require(:source_account).permit(:service, :email, :password, :account, :agency)
    end
end
