Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :doctors, only: [:show, :update]
  resources :doctor_patients, only: [:destroy]
  resources :hospitals, only: [:show] do
    resources :patients, only: [:index]
    resources :doctors, only: [:new, :create]
  end

  get "/doctors/:id/reassign", to: 'doctors#reassign'
end
