Rails.application.routes.draw do
  resources  :orders
  devise_for :users

  root   'products#index'
  get    '/products'            => 'products#index'
  get    '/products/new'        => 'products#new'
  post   '/products'            => 'products#create'  
  get    '/products/:id'        => 'products#show'
  get    '/products/:id/edit'   => 'products#edit'
  patch  '/products/:id'        => 'products#update'
  delete '/products/:id'        => 'products#destroy'

  post   '/search'              => 'products#search'

  get    '/products/images/new' => 'images#new'
  post   '/products/images'     => 'images#create'

  post   '/orders'              => 'orders#create'
  get    '/orders/:id'          => 'orders#show'
  get    '/orders'              => 'orders#index'
end