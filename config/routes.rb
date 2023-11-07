Rails.application.routes.draw do
  get '/welcome' => 'users#welcome'
  get '/home' => 'categories#index', as: :home
  get '/categories/new' => 'categories#new', as: :new_category
  get '/categories/:category_id/payment' => 'payments#index', as: :payments
  get '/categories/:category_id/payment/new' => 'payments#new', as: :new_payments

  post '/categories' => 'categories#create'
  post '/payments' => 'payments#create'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/users/password' => 'devise/passwords#update'
  end
  # resources :users
  resources :categories
  resources :payments
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "categories#index"
  authenticated :user do
  root "categories#index", as: :authenticated_root
end

unauthenticated do
  root "users#welcome", as: :unauthenticated_root
end
end
