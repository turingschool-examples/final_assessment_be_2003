Rails.application.routes.draw do

  get '/doctors/:id', to: 'doctors#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
