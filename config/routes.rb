Rails.application.routes.draw do

  resources :doctors, only: [:show, :edit, :update]
  delete '/doctors/:doctor_id/patients/:patient_id', to: 'doctor_patients#destroy'

  resources :hospitals, only: [:show] do
    resources :doctors, only: [:new, :create]
  end
  get '/hospitals/:hospital_id/patients', to: 'hospital_patients#index'

end
