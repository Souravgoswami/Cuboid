Rails.application.routes.draw do
  get "/404", to: 'errors#not_found'
  get "/422", to: 'errors#unacceptable'
  get "/500", to: 'errors#internal_error'

  resources :wishlists

  patch 'line_items/:id/update_quantity', to: 'line_items#update_quantity', as: 'line_item_update_quantity'
  resources :line_items

  get 'products/search', to: 'products#search', as: 'products_search'
  get 'products/checkout_all', to: 'products#checkout_all', as: 'products_checkout_all'
  patch 'products/:id/add_to_line_items', to: 'products#add_to_line_items', as: 'product_add_to_line_items'
  get 'products/:id/checkout', to: 'products#checkout', as: 'product_checkout'
  patch 'products/:id/add_to_wishlist', to: 'products#add_to_wishlist', as: 'product_add_to_wishlist'

  resources :products
  resources :tags

  get 'pages/home'
  get 'pages/about', as: 'about'
  get 'contact', to: 'pages#contact'
  get 'help', to: 'pages#help'

  root to: 'products#index'

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register', cart: 'cart' }
end
