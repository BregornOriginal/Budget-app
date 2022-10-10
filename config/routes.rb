Rails.application.routes.draw do
  root "home#index"
  devise_for :users
  resources :users
  resources :budgets
  resources :groups
  resources :home
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
