# Rails.application.routes.draw do
  
  # devise_for :users
  # devise_for :users
#   root 'companies#index'
#   resources :imports, only: [:new, :create]
#   get "/export(/:id)", to: "imports#export", as: :export
#   post "/send_email(/:id)", to: "employees#send_email", as: :send_email
#   resources :companies do
#     resources :employees
#   end
# end
Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations", passwords: "users/passwords" }

  # devise_for :users
  root 'imports#index'
  resources :imports, only: [:new, :create]
  post "/export(/:id)", to: "imports#export", as: :export
   post "/send_email(/:id)", to: "employees#send_email", as: :send_email
  # get 'employees', to: 'employees#index'
  # post ".send_email", to: "salaries#send_email", as: :send_email
  resources :salaries

  # resources :companies do
  #   resources :employees
  # end
  resources :companies 
  resources :employees
end