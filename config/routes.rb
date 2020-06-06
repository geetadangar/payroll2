Rails.application.routes.draw do
  root 'imports#index'
  # root 'companies#index'
  # resources :companies
  # get 'imports#index'
  resources :imports
  # resources :imports, only: [:new, :create]
end
