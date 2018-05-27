Rails.application.routes.draw do
  root 'sessions#new'
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:create]
  get    '/login',  to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
end
