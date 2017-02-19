class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    resource.sign_in_count > 1 ? my_root_path : new_my_account_path
  end
end
