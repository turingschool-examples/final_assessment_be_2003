Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get :root, to: 'welcome#index'

  resources :doctors, only: [:show] do 
    resources :patients, only: [:destroy], controller: "doctor_patients"
  end 

  patch "/doctors/:doctor_id/update_hospital", to: "doctors#update_hospital"
  get "/doctors/:doctor_id/reassign", to: "doctors#edit_hospital"

  resources :hospitals, only: [:show] do 
    resources :patients, only: [:index], controller: "hospital_patients"
    resources :doctors, only: [:new, :create], controller: "hospital_doctors"
  end 
end
