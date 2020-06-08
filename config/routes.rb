Rails.application.routes.draw do
  get "/hospitals/:id", to: "hospitals#show"
  get "/hospitals/:hospital_id/doctors/new", to: "doctors#new"
  post "/hospitals/:hospital_id/doctors", to: "doctors#create"
  get "/hospitals/:id/patients", to: "hospitals_patients#index"

  get "/doctors/:id", to: "doctors#show"
  get "/doctors/:id/edit", to: "doctors#edit"
  patch "/doctors/:id", to: "doctors#update"
  delete "/doctors/:doctor_id/patients/:patient_id", to: "patients#destroy"
end
