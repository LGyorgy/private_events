Rails.application.routes.draw do
  root 'events#index'
  resources :users,    only: [:new, :create, :show]
  resources :sessions, only: [:create]
  resources :events,   only: [:new, :create, :show, :index]
  get    '/login',  to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'

  resources :invitations, only: :create
  get '/new_invitation/:event_id', to: 'invitations#new',
                                   as: 'new_invitation'
  get '/users/:id/invitations', to: 'invitations#index',
                                as: 'user_invitations'

  get '/accept_invitation/:id', to: 'attendances#create',
                                  as: 'accept_invitation'
end