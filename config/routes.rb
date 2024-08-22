Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")


  root "welcome#index"
  get '/register', to: 'users#new', as: 'register_user'

  get "/users/:id/discover", to: "discover#index"
  get "/users/:id/top_rated_movies", to: "top_rated_movies#index"
  post "/users/:id/discover", to: "discover#search"

  resources :users, only: [:show, :create] do
  end
end
