Rails.application.routes.draw do
  root to: "users#landing"

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'  

  resources :posts 
  resources :users, only: [:show, :create, :edit, :update, :index] do
    member do
      post 'Follow'
      post 'Unfollow'  
      get '/timeline', to: 'users#timeline'              
    end
    resources :relationships, only: [:create, :destroy, :index]  
  end
  resources :password_resets

end
