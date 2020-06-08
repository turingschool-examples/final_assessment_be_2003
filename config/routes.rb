Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :doctors, only: [:show]
  resources :hospitals, only: [:show] do
    get '/patients', to: 'hospital_patients#index'
    resources :doctors, only: [:new, :create]
  end
  resources :doctor_patients, only: [:destroy]
end
