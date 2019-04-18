Rails.application.routes.draw do
  root "homepages#index"

  resources :trips
  resources :drivers, only: [:index, :show, :new, :create] do
    resources :trips, only: [:index, :show]
  end
  resources :passengers
end
