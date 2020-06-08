Rails.application.routes.draw do

  get '/doctors/:id', to: 'doctors#show'

  get '/hospitals/:id', to: 'hospitals#show'
  get '/hospitals/:hospital_id/patients', to: 'hospital_patients#index'

  get '/hospitals/:hospital_id/doctors/new', to: 'doctors#new'
  post '/hospitals/:hospital_id/doctors', to: 'doctors#create'
end
