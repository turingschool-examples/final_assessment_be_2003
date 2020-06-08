Rails.application.routes.draw do

  resources :doctors, only: [:show]
  resources :hospitals, only: [:show]
  get '/hospitals/:id/patients', to: 'patients#index'
  get '/hospitals/:hospital_id/doctors/new', to: 'doctors#new'
  post '/hospitals/:hospital_id', to: 'doctors#create'
end
