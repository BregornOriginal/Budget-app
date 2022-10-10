Rails.application.routes.draw do
  root "groups#index"
  devise_for :users
  resources :users
  resources :budgets
  resources :groups
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
