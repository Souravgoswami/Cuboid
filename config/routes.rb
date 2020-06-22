Rails.application.routes.draw do
  # patch 'wishlists/:id/remove_'
  resources :wishlists
  resources :line_items

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
