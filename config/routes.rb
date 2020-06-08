Rails.application.routes.draw do

  resources :doctors, only: [:show]
  delete '/doctors/:doctor_id/patients/:patient_id', to: 'doctor_patients#destroy'
  get '/doctors/:doctor_id/edit', to: 'doctors#edit'
  patch '/doctors/:doctor_id', to: 'doctors#update'

  get '/hospitals/:id', to: 'hospitals#show'
  get '/hospitals/:hospital_id/patients', to: 'hospital_patients#index'

  get '/hospitals/:hospital_id/doctors/new', to: 'doctors#new'
  post '/hospitals/:hospital_id/doctors', to: 'doctors#create'
end
