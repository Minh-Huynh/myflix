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

  get 'home', to:'videos#index'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy'
  post 'login', to: 'sessions#create'

  get 'my_queue', to:'queue_items#index'
  post 'my_queue/update', to: 'queue_items#update'
  post 'my_queue/create', to: 'queue_items#create'
  post 'my_queue/destroy/:id', to: 'queue_items#destroy', as: 'my_queue_destroy'
end
