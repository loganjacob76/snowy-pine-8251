Rails.application.routes.draw do
  resources :airlines, only: :show

  resources :flights, only: :index do
    resources :passenger_flights, only: :destroy
  end
end
