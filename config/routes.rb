Rails.application.routes.draw do
  get '/sessions/new', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  delete '/sessions', to: 'sessions#destroy'


  resources :users
  resources :posts do
    resources :comments
  end
  root 'posts#index'
end
