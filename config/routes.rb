Rails.application.routes.draw do
  devise_for :users,
             path: '',
             path_names: { sign_in: 'login', sign_out: 'logout' },
             controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  namespace 'my' do
    root to: 'dashboard#index'
    put :terminate_coin_bank, to: 'dashboard#terminate_coin_bank'

    resource :contributing_projects, 'contributing_projects'
    resources :accounts do
      get :upload_csv, on: :member
      post :process_csv, on: :member
    end
  end

  resources :projects do
    resource :account, controller: 'projects/accounts'
  end

  resources :users
end
