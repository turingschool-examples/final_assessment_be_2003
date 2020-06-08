Rails.application.routes.draw do
  get "/doctors/:id", to: "doctors#show"
  post "/doctors/:id", to: "doctors#create"
  patch "/doctors/:id", to: "doctors#update"
  get "/hospitals/:id/new", to: "doctors#new"
  get "/doctors/:id/edit", to: "doctors#edit"

  get "/hospitals/:id", to: "hospitals#show"

  get "/hospitals/:id/patients", to: "patients#index"
  get "/patients/:id/edit", to: "patients#edit"
end
