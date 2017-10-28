Rails.application.routes.draw do     
  resources :counties
  resources :states
  resources :cities
  resources :locations
  resources :seo_landing_pages, only: [:show]
  resources :places, only: [:show]

  
  root to: 'home#index'

  get '/*path', to: 'seo_landing_pages#show'
end
