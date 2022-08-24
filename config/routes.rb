Rails.application.routes.draw do
  get 'calculator/index'

  root 'calculator#index'
end