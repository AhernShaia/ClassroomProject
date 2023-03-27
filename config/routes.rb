Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :resumes
  get "/resumes", to: "resumes#index"
  get "/resumes/new", to: "resumes#new"
  get "/resumes/edit", to: "resumes#edit"
  get "/resumes/show", to: "resumes#show"
  post "/resumes", to: "resumes#create"

  root "pages#home"
  # get "/", to: "pages#home", as: "root"
  get "/about", to: "pages#about"
  get "/contact", to: "pages#contact"
end
