Rails.application.routes.draw do
  root 'companies#index'
  resources :imports, only: [:new, :create]
  resources :companies do
    resources :employees
  end
end