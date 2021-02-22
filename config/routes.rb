Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    post "/login", to: "users#login"
    get "/auto_login", to: "users#auto_login"
    resources :clients, except: :index do
      post '/wishlist_products/:product_id', to: "wishlist_products#create"
    end
  end
end
