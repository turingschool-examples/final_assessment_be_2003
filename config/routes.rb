Rails.application.routes.draw do

  resources :doctors, only: [:show, :edit, :update]
  resources :hospitals, only: [:show] do
    resources :patients, only: [:index]
    resources :doctors, only: [:new, :create]
  end
  resources :doctor_patients, only: [:destroy]
end
