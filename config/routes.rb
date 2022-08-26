Rails.application.routes.draw do
  resources :mortgages, only: [:new, :create, :edit, :show]

  root 'mortgages#new'
end