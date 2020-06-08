Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :doctors, only: [:show, :edit, :update]

  resources :hospitals, only: [:show]
  get '/hospitals/:id/patients', to: "patients#index"
  get '/hospitals/:id/doctors/new', to: "doctors#new"
  post '/hospitals/:hospital_id/doctors', to: 'doctors#create'

  delete '/patients/:id', to: 'doctor_patients#destroy'
end
