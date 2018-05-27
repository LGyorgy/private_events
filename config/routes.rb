Rails.application.routes.draw do
  root 'events#index'
  resources :users,    only: [:new, :create, :show]
  resources :sessions, only: [:create]
  resources :events,   only: [:new, :create, :show, :index]
  get    '/login',  to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
end
