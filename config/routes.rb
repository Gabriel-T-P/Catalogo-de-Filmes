Rails.application.routes.draw do
 
  root "home#index"

  resources :movie_genres, only: [:edit, :update, :show, :new, :create]
  resources :directors, only: [:edit, :update, :show, :new, :create]
  resources :movies, only: [:edit, :update, :show, :new, :create, :index]
  
  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

end
