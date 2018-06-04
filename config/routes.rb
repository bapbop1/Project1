Rails.application.routes.draw do
  root "static_pages#home"
  namespace :admin do
    root "static_pages#home"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :categories
    resources :users
  end
end
