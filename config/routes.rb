Rails.application.routes.draw do

  resources :doctors, only: [:show]
  resources :hospitals, only: [:show]
  get '/hospitals/:id/patients', to: 'patients#index'
end
