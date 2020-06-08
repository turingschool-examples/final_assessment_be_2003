Rails.application.routes.draw do


  get '/hospitals/:id', to: 'hospitals#show'
  get '/hospitals/:id/patient_index', to: 'hospitals#index'
  get '/hospitals/:id/new_doctor', to: 'doctors#new'

  post '/doctors', to: 'doctors#create'

  get '/doctors/:id', to: 'doctors#show'
  get '/doctors/:id/edit', to: 'doctors#edit'
  patch '/doctors/:id', to: 'doctors#update'


  delete '/patients/:patient_id/:doc_id', to: 'patients#destroy'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
