Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root to: 'users#index'
  # get '/users/', to: 'users#index' # path, to index usercontroller --> method
  # get "/users/:id", to: "users#show"
  # resources :users, only: %i[index show]
  # resources :posts, only: %i[index show]
  
  root to: 'users#index'
  resources :users, only: %i[show index] do
    resources :posts, only: %i[show index new create]
  end
end


# root 'users#index' resources :users, only: [:index, :show] do resources :posts, only: [:index, :show] end 