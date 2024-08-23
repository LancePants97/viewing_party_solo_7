Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")


  root "welcome#index"
  get '/register', to: 'users#new', as: 'register_user'

  get "/users/:id/discover", to: "discover#index"
  post "/users/:id/discover", to: "discover#search"

  get "/users/:id/top_rated_movies", to: "top_rated_movies#index"
  get "/users/:id/movies", to: "movies#index"

  resources :users, only: [:show, :create] do
  end
end
