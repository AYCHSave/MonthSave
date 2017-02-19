class My::AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy, :process_csv]

  def index
    @accounts = current_user.accounts.all
  end

  def show
  end

  def new
    @account = current_user.accounts.new
  end

  def edit
  end

  def create
    @account = current_user.accounts.new(account_params)

    if @account.save
      redirect_to my_accounts_path, notice: 'Account was successfully created.'
    else
      render :new
    end
  end

  def update
    if @account.update(account_params)
      redirect_to my_accounts_path, notice: 'Account was successfully updated.'
    else
      render :edit
    end
  end

  def upload_csv

  end

  def process_csv
    count = Transactions::ImportCsv.new(@account, params['csv']['file'].tempfile.path).process

    redirect_to my_accounts_path, notice: "#{count} registros importados com sucesso."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = current_user.accounts.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def account_params
      params.require(:source_account).permit(:service)
    end
end
