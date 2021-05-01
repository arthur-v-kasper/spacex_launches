Rails.application.routes.draw do
  root 'launch#index'
  get 'launch/past', to: 'launch#past'
  get 'launch/upcoming', to: 'launch#upcoming'
  get 'launch/latest', to: 'launch#latest'
  get 'launch/next', to: 'launch#next'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end