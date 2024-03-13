Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root "places#index"
 
  namespace :api do
    namespace :v1 do
      resources :places, path: "/places"
      resources :speed, path: "/new-internet-speed", to "/internet_speed#new"
    end
  end
  # get "api/v1/places" to "api/v1/places#index"
end

