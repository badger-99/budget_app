Rails.application.routes.draw do
  get '/welcome' => 'users#welcome', as: :welcome
  get '/home' => 'categories#index', as: :home
  get '/categories/new' => 'categories#new', as: :new_category
  get '/categories/:category_id/payment' => 'payments#index', as: :payments
  get '/categories/:category_id/payment/new' => 'payments#new', as: :new_payment

  post '/categories' => 'categories#create'
  post '/categories/:category_id/payment' => 'payments#create'

  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/users/password' => 'devise/passwords#update'
  end

  get "up" => "rails/health#show", as: :rails_health_check

  authenticated :user do
    root "categories#index", as: :authenticated_root
  end

  unauthenticated do
    root "users#welcome", as: :unauthenticated_root
  end
end
