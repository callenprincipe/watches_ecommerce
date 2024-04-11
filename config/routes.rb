Rails.application.routes.draw do
  devise_for :customers, controllers: {
    registrations: 'customer/registrations'
  }
  get 'shopping_cart/index'
  post 'shopping_cart/add/:id', to: 'shopping_cart#add', as: 'add_watch_to_cart'
  delete 'shopping_cart/remove/:id', to: 'shopping_cart#remove', as: 'remove_watch_from_cart'
  patch 'shopping_cart/update_cart/:id', to: 'shopping_cart#update_cart', as: 'update_cart'

  get 'checkout', to: 'checkout#checkout', as: 'checkout'

  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)
  resources :orders
  resources :order_details
# resources :customers
  resources :watches
  resources :models
  resources :brands

  root 'watches#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
