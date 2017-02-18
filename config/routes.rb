Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }

  namespace 'my' do
    root to: 'dashboard#index'
  end

  resources :users, :projects
end
