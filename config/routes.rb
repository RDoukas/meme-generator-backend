Rails.application.routes.draw do
  
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
     post "/users" => "users#create"
     post "/login" => "sessions#create"
     delete "/logout" => "sessions#destroy"
     get "/logged_in", to: "sessions#is_logged_in?"


     post "/memes" => "memes#create"
     get "/memes" => "memes#index"
     get "/memes/:id" => "memes#show"
     patch "/memes/:id" => "memes#update"
     delete "/memes/:id" => "memes#delete"
  end
end
