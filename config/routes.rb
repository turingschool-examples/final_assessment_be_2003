Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "hospitals#index"
  resources :doctors, only: [:show, :edit, :update]
  resources :hospitals, only: [:show] do
    resources :patients, only: [:index]
    resources :doctors, only: [:new, :create]
  end
  resources :doctor_patients, only: [:destroy]
end
