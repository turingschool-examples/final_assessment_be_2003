Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/doctors/:id', to: 'doctors#show'
  patch '/doctors/:id/edit', to: 'doctors#edit'
  post '/doctors/:id', to: 'doctors#update'

  delete '/doctors/:doctor_id/patients/:id', to: 'patients#destroy'

  get '/hospitals/:id', to: 'hospitals#show'
  get '/hospitals/:id/patients', to: 'hospital_patients#index'
  get '/hospitals/:id/doctors/new', to: 'doctors#new'
  post '/hospitals/:id/doctors', to: 'doctors#create'
end
