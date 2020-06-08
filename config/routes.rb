Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get'/doctors/:doctor_id', to: "doctors#show"

  get'hospitals/:hospital_id', to: "hospitals#show"
  get'hospitals/:hospital_id/patients', to: "hospital_patients#index"
  get'hospitals/:hospital_id/doctors/new', to: "doctors#new"
  post'hospitals/:hospital_id/doctors/new', to: "doctors#create"

  delete "/doctors/:doctor_id/patients/:patient_id", to: "patients#destroy"
end
