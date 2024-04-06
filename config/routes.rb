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
  # # Index
  # get '/orders', to: 'orders#index', as: 'orders'
  # # Show
  # get '/orders/:id', to: 'orders#show', as: 'order'
  # # New
  # get '/orders/new', to: 'orders#new', as: 'new_order'
  # # Edit
  # get '/orders/:id/edit', to: 'orders#edit', as: 'edit_order'
  # # Create
  # post '/orders', to: 'orders#create'
  # # Update
  # # 注意：Rails通常使用PATCH作为更新资源的HTTP方法
  # patch '/orders/:id', to: 'orders#update'
  # # 如果你也想支持PUT，可以这样添加：
  # put '/orders/:id', to: 'orders#update'
  # # Destroy
  # delete '/orders/:id', to: 'orders#destroy'
  resources :orders

  get 'my_orders', to: 'orders#index'
  get 'payment', to:'payments#payment'
  # post 'payments/create_payment_intent', to: 'payments#create_payment_intent' ,as: 'payment_intent'
  post 'payments/create_checkout_session', to: 'payments#create_checkout_session' ,as: 'payment_session'
  get 'payments/success', to:'payments#success'
  get 'payments/success', to:'payments#cancel'


  get 'contactus', to: 'static_pages#contact_us', as: :contact_us
  get 'aboutus', to: 'static_pages#about_us', as: :about_us

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
