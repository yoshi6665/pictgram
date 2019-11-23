Rails.application.routes.draw do
 
  
  
  get 'comments/create'
  get 'comments/destroy'
  get 'sessions/new'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'topics#index'
  get 'pages/help'
  
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users 
  resources :topics do
    resources :comments, only: [:new, :create, :destroy]
  end 
    
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'
  
  
end
