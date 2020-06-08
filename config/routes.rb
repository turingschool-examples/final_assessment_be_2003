Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :doctors
  get '/hospitals/:id/doctorApp', to: "doctors#new"
  post '/hospitals/:id', to: "doctors#create"
  delete '/doctors/:doctor_id/:patient_id', to: "patient_doctor#destroy"
  resources :hospitals
  get '/hospitals/:id/patients', to: "hospital_patients#index"
end
