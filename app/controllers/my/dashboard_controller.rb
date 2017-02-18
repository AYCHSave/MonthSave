class My::DashboardController < ApplicationController
  def index
    @contributing_projects = current_user.contributing_projects
  end
end
