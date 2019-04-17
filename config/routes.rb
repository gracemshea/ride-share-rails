Rails.application.routes.draw do
  root "homepages#index"

  resources :trips, except: [:new, :create]
  resources :drivers, only: [:index, :show, :new, :create]
  resources :passengers
end
