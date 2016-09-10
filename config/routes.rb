Rails.application.routes.draw do
  root :to => 'lists#index'

  get "/sign_in" => "sessions#new"
  post "/sign_in" => "sessions#create"
  get "/sign_out" => "sessions#destroy"

  resources :users, only: [:new, :create]

  resources :lists do
    resources :tasks, :except => [:show, :index]
  end
end
