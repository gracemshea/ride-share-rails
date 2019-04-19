Rails.application.routes.draw do
  root "homepages#index"

  resources :trips
  resources :drivers do
    resources :trips, only: [:index, :show]
  end
  resources :passengers
end
