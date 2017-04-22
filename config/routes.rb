Myflix::Application.routes.draw do
  root to: 'sessions#new'
  get 'ui(/:action)', controller: 'ui'
  get 'category/:id', to: 'categories#show'

  resources :videos do
    collection do
      post 'search', to: "videos#search"
    end
    resources :reviews, only:[:create]
  end

  resources :follows, only: [:index,:create,:destroy]

  resources :users, except: :destroy
  namespace :admin do
    resources :videos, only: [:new, :create]
  end

  get 'home', to:'videos#index'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy'
  post 'login', to: 'sessions#create'

  get 'forgot_password', to: 'forgot_passwords#new'
  resources :forgot_passwords, only: [:create]
  get 'forgot_password_confirmation', to: 'forgot_passwords#confirm'
  resources :password_resets, only: [:show, :create]
  get 'expired_token',to: 'password_resets#expired_token'

  get 'my_queue', to:'queue_items#index'
  post 'my_queue/update', to: 'queue_items#update'
  post 'my_queue/create', to: 'queue_items#create'
  post 'my_queue/destroy/:id', to: 'queue_items#destroy', as: 'my_queue_destroy'

  resources :invitations, only:[:new, :create]
  get 'invitation_confirmation', to: 'invitations#confirm'
  resources :registrations, only: [:show, :create]
end
