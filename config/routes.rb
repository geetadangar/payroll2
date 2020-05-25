Rails.application.routes.draw do
  get 'imports/new'
  get 'imports/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
# root 'company#index'
 # get 'welcome/index'
# resources :employee
# resources :company

  resources :company
  resources :imports, only: [:new, :create]

  root to: 'company#index'
end
