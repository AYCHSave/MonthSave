class Projects::AccountsController < ApplicationController
  before_action :set_project
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  # GET /projects/accounts/1
  def show
  end

  # GET /projects/accounts/new
  def new
    @account = @project.build_account
  end

  # GET /projects/accounts/1/edit
  def edit
  end

  # POST /projects/accounts
  def create
    @account = @project.build_account(account_params)

    if @account.save
      redirect_to project_account_path(@project, @account), notice: 'Account was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /projects/accounts/1
  def update
    if @account.update(account_params)
      redirect_to project_account_path(@project), notice: 'Account was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /projects/accounts/1
  def destroy
    @account.destroy
    redirect_to @project, notice: 'Account was successfully destroyed.'
  end

  private
  def set_project
    @project = current_user.own_projects.find(params[:project_id])
  end

  def set_account
    @account = @project.account
  end

  # Only allow a trusted parameter "white list" through.
  def account_params
    params.require(:withdrawal_account).permit(:service)
  end
end
