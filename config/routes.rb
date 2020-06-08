Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :doctors, only: [:edit, :update, :show]
  resources :hospitals, only: [:show] do
    resources :patients, only: [:index], controller: 'hospital_patients'
    resources :doctors, only: [:new, :create]
  end

  resources :patient_doctor, only: [:destroy]
end
