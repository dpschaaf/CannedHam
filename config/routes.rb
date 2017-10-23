Rails.application.routes.draw do     
  resources :counties
  resources :states
  resources :cities
  resources :metals

  resources :seo_landing_pages, only: [:show]

  root to: 'home#index'
end
