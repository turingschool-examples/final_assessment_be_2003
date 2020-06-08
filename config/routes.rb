Rails.application.routes.draw do
  get "/doctors/:id", to: "doctors#show"

  get "/hospitals/:id", to: "hospitals#show"
  get "/hospitals/:id/patients", to: "patients#index"
  get "/hospitals/:id/new", to: "doctors#new"
end
