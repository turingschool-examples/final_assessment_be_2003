Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/doctors/:id", to: 'doctors#show'

  get "/hospitals/:id", to: 'hospitals#show'
  get "/hospitals/:id/doctors/new", to: 'doctors#new'
  post "/hospitals/:id/doctors", to: 'doctors#create'

  get "/hospitals/:id/patients", to: 'hospitals#index'

  delete "/doctors/:doctor_id/patients/:patient_id", to: 'doctors#destory'
  get "/doctors/:id/edit", to: 'doctors#edit'
  patch "/doctors/:doctor_id", to: 'doctors#update'


end
