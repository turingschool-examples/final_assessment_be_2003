Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :hospitals, only: [:show]
  resources :doctors, only: [:show]
  get "/hospitals/:hospital_id/patients/index", to: 'patients#index'

  get "/hospitals/:hospital_id/doctors/new", to: 'doctors#new'
  post '/hospitals/:hospital_id/doctors', to: 'doctors#create'
end
