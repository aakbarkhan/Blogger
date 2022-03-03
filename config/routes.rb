Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root to: 'users#index'
  # get '/users/', to: 'users#index' # path, to index usercontroller --> method
  # get "/users/:id", to: "users#show"
  resources :users, only: %i[index show]
  resources :posts, only: %i[index show]
end
