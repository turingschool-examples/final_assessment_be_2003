Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :doctors, only: [:show, :edit, :update] do
    resources :patients, only: [:destroy]
  end
  resources :hospitals, only: [:show] do
    resources :patients, only: [:index]
    resources :doctors, only: [:new, :create]
  end
end
