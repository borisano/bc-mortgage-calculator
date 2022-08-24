Rails.application.routes.draw do
  get 'calculator/new'

  root 'calculator#new'
end