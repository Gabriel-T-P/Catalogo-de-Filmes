Rails.application.routes.draw do
 
  root "home#index"

  resources :movie_genres
  
end
