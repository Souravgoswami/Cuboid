Rails.application.routes.draw do
  get 'pages/home'
  get 'pages/about', as: 'about'
  get 'contact', to: 'pages#contact'
  get 'help', to: 'pages#help'

  root to: 'pages#home'
  # For details on the SL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  # devise_for :users
end
