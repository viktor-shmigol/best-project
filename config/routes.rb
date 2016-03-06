Rails.application.routes.draw do
  root to: 'home#index'

  resources :sessions, only: [:create, :destroy]
  resources :tasks
  resources :boards
  resources :lists
  resources :users
  resources :members

  get '*path' => 'home#index'
end
