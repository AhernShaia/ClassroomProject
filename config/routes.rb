Rails.application.routes.draw do
  resource :sessions, only: %i[create destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :resumes
  resource :users, except: %i[new destroy] do
    get "sign_up", action: "new"
    get "sign_in"
  end
  resource :session, only: %i[create destroy]
  get "/resumes/:id/edit", to: "resumes#edit", as: "edit_resumes"
  get "/resumes", to: "resumes#index"
  get "/resumes/new", to: "resumes#new"
  get "/resumes/:id", to: "resumes#show", as: "resume"
  delete "/resumes/:id", to: "resumes#destroy"
  patch "/resumes/:id", to: "resumes#update"
  post "/resumes", to: "resumes#create"
  root "pages#home"

  # get "/resumes/@:userid/:slug", to: "resumes#slug"

  get "/about", to: "pages#about"
  get "/contact", to: "pages#contact"
end
