Rails.application.routes.draw do
  get "/doctors/:id", to: "doctors#show"
  post "/doctors/:id/edit_hospital", to: "doctors#edit"

  delete "/patients/:id", to: "patients#destroy"

  get "/hospitals/:id", to: "hospitals#show"

  namespace "hospitals", path: "hospitals/:id" do 
    get "/patients", to: "patients#index"
    get "/doctors/new", to: "doctors#new"
    post "/doctors/create", to: "doctors#create"
  end

end
