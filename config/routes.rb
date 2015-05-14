Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root to: 'home#index'
    end

    unauthenticated :user do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end

    resources :tasks
  end
end
