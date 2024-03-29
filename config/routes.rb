Rails.application.routes.draw do
  devise_for :users

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'products#index'

  #resources :products
  resources :products, only: [:index, :show]
  get 'cart', to: 'carts#show'
  post 'cart/add', to: 'carts#add_to_cart', as: :add_to_cart
  post 'cart/update', to: 'carts#update', as: :update_cart
  delete 'cart/remove_item', to: 'carts#remove_item', as: :remove_cart_item

  get 'user', to: 'users#index'

  # orders
  resources :orders

  get 'payment', to:'orders#payment'


  get 'contactus', to: 'static_pages#contact_us', as: :contact_us
  get 'aboutus', to: 'static_pages#about_us', as: :about_us

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
