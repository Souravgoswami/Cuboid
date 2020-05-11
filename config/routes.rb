Rails.application.routes.draw do
  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
