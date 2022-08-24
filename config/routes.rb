Rails.application.routes.draw do
  resources :mortgages, only: [:new, :create]

  root 'calculator#new'
end