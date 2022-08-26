Rails.application.routes.draw do
  resources :mortgages, only: [:new, :create, :edit]

  root 'mortgages#new'
end