Rails.application.routes.draw do
  get 'categories/index'

  get 'categories/show'

  root "static_pages#home"
  get "help" => "static_pages#help"
  get "about" => "static_pages#about"
  get "contact" => "static_pages#contact"
  get "login" =>"sessions#new"
  post "login" =>"sessions#create"
  delete "logout" =>"sessions#destroy"
  resources :users
  get "signup" => "users#new"
  namespace :admin do
    root "categories#index"
    resources :users, only: [:destroy]
    resources :categories do
      resources :words
    end
  end
end
