class My::DashboardController < ApplicationController
  def index
    @contributing_projects = current_user.contributing_projects
    @coin_banks = current_user.coin_banks
  end
end
