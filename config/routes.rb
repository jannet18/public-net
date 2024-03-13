Rails.application.routes.draw do
# root "places#index"
  # get "/new-internet-speed", to: "/internet_speed"
  resources :speed, path: "/new-internet-speed", to: "places/internet_speeds/new"
  namespace :api do
    namespace :v1 do
      resources :places, path: "/places" 

    end
  end 
end

