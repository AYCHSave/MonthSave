class My::DashboardController < ApplicationController
  def index
    @contributing_projects = current_user.contributing_projects
    @coin_banks = current_user.coin_banks
  end

  def projects
    @projects = current_user.own_projects
  end

  def terminate_coin_bank
    TerminateCoinBank.new(current_user.coin_banks.active).call

    redirect_to my_root_path,
                notice: 'Cofrinho finalizado com sucesso. Um novo cofrinho foi criado.'
  end
end
