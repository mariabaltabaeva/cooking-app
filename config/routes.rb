Rails.application.routes.draw do

  resources :ingredients
  
  resources :recipes

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'
end
