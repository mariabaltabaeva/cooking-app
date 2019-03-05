Rails.application.routes.draw do

  resources :recipes

  resources :ingredients

  get 'about' => 'welcome#about'

  root 'welcome#index'

end
