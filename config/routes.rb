Rails.application.routes.draw do

  resources :doctors, only: [:show, :edit, :update]
  delete '/doctors/:doctor_id/patients/:patient_id', to: 'doctor_patients#destroy'

  resources :hospitals, only: [:show]
  get '/hospitals/:hospital_id/patients', to: 'hospital_patients#index'

  get '/hospitals/:hospital_id/doctors/new', to: 'doctors#new'
  post '/hospitals/:hospital_id/doctors', to: 'doctors#create'
end
