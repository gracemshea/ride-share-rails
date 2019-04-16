Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Trips
  resources :trips

  # Drivers
  resources :drivers, only: [:index, :show]

  # Passengers

  # Home??

end
