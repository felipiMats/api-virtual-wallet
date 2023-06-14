Rails.application.routes.draw do
  resources :extracts
  resources :wallets do
  post 'withdraw_or_deposit', on: :member
  end
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
