Rails.application.routes.draw do
  resources  :orders
  devise_for :users

  root 'products#index'
  get  '/products'        => 'products#index'
  get  '/products/:id'    => 'products#show'
  get  '/products/random' => 'products#random'
  get  '/products/new'    => 'products#new'
  post '/products'        => 'products#create'

  post '/search' => 'products#search'

  get  'images/new' => 'images#new'
  post 'images'     => 'images#create'

  get    '/carted_products'     => 'carted_products#index'
  post   '/carted_products'     => 'carted_products#create'
  delete '/carted_products/:id' => 'carted_products#destroy'

  get    '/orders/show'     => 'orders#show'
  post   '/orders'          => 'orders#create'
  get    '/orders/:id/edit' => 'orders#edit'
  patch  '/orders/:id'      => 'orders#update'
  delete '/orders/:id'      => 'orders#destroy'
end