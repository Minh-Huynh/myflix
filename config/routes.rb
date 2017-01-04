Myflix::Application.routes.draw do
  get 'ui(/:action)', controller: 'ui'
  get 'home', to:'videos#index'
  get 'video/:id', to: 'videos#show'
  get 'category/:id', to: 'categories#show'
end
