Rails.application.routes.draw do
  
  get '/doctors/:id', to: 'doctors#show'
  get '/doctors/:id/edit', to: 'doctors#edit'
  patch '/doctors/:id', to: 'doctors#update'

  get '/hospitals/:id', to: 'hospitals#show'

  get '/hospitals/:id/patients', to: 'hospital_patients#index'

  get '/hospitals/:id/doctors/new', to: 'hospital_doctors#new'
  post '/hospitals/:id/doctors', to: 'hospital_doctors#create' 

  delete '/doctors/:doc_id/patients/:id', to: 'doctor_patients#destroy'
end
