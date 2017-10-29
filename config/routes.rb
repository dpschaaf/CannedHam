Rails.application.routes.draw do     
  root to: 'home#index'

  resources :cities, only: [:show]
  resources :counties, only: [:show]
  resources :states, only: [:show]
  resources :seo_landing_pages, only: [:show]
  resources :places, only: [:show]

  get '/*path', to: 'seo_landing_pages#show'
end
