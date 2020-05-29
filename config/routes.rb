Rails.application.routes.draw do
  root 'companies#index'
  resources :companies
  resources :imports, only: [:new, :create]
end
