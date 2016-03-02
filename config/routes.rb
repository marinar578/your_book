Rails.application.routes.draw do
  resources :library_locations
  resources :volumes
  resources :users
  root 'static#index'

end
