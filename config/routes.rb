Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get :root, to: 'welcome#index'

  resources :doctors, only: [:show]

  resources :hospitals, only: [:show] do 
    resources :patients, only: [:index], controller: "hospital_patients"
  end 
end
