Rails.application.routes.draw do     
  resources :counties
  resources :states
  resources :cities
  resources :metals

  resources :seo_landing_pages, only: [:show]

  get '/*path', to: 'seo_landing_pages#show'

  root to: 'home#index'
end
