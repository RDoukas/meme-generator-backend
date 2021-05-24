Rails.application.routes.draw do
  
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'
  
  resources :users, only: [:create, :show, :index]

  namespace :api do

     post "/memes" => "memes#create"
     get "/memes" => "memes#index"
     get "/memes/:id" => "memes#show"
     patch "/memes/:id" => "memes#update"
     delete "/memes/:id" => "memes#delete"
  end
end
