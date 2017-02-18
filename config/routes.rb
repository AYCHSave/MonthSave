Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'auth/omniauth_callbacks' }

  devise_scope :user do
    get 'login', :to => 'auth/sessions#new', :as => :new_user_session
    delete 'logout', :to => 'auth/sessions#destroy', :as => :destroy_user_session
  end
end
