Rails.application.routes.draw do
  
  get '/doctors/:id', to: 'doctors#show'

  get '/hospitals/:id', to: 'hospitals#show'

  get '/hospitals/:id/patients', to: 'hospital_patients#index'
end
