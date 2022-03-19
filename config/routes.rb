Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  namespace :api, default: {format: :json} do 
    namespace :v1,  default: {format: :json} do
      resources :users, only: [:index, :show] do
      resources :posts, only: [:index, :show, :create] do
        resources :comments, only: [:index, :create]
      end
    end
  end
end

  resources :users, only: %i[index show] do 
    resources :posts, only: %i[index new create show destroy]
  end

  resources :posts do
    resources :comments, only: %i[create destroy]
    resources :likes, only: %i[create]
  end
  resources :comments, only: %i[destroy]
  resources :likes, only: %i[destroy]
end

