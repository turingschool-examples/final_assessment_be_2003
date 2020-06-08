Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/doctors/:id", to: 'doctors#show'

  get "/hospitals/:id", to: 'hospitals#show'
  get "/hospitals/:id/doctors/new", to: 'doctors#new'
  post "/hospitals/:id/doctors", to: 'doctors#create'

end
