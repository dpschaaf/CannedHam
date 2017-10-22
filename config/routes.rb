Rails.application.routes.draw do     
  resources :counties
  resources :states
  resources :cities
  resources :metals

  get '*path', to: 'counties#show', constraints: CountyConstraint.new
  get '*path', to: 'states#show', constraints: StateConstraint.new

  root to: 'states#index'
end
