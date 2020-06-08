Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/doctors/:id", to: 'doctors#show'
  get "/hospitals/:id", to: 'hospitals#show'
  get "/hospitals/:id/patients", to: 'hospital_patients#index'
  get "/hospitals/:id/doctors/new", to: 'doctors#new'
  post "/doctors", to: 'doctors#create'
  get "/doctors/:id/edit", to: 'doctors#edit'
  patch "/doctors/:id", to: 'doctors#update'
end
