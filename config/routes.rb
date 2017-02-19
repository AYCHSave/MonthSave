Rails.application.routes.draw do
  devise_for :users,
             path: '',
             path_names: { sign_in: 'login', sign_out: 'logout' }

  namespace 'my' do
    root to: 'dashboard#index'
    resource :contributing_projects, 'contributing_projects'
  end

  resources :projects do
    resource :account, controller: 'projects/accounts'
  end

  resources :users
end
