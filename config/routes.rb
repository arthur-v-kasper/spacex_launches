Rails.application.routes.draw do
  root 'lauch#index'
  get 'lauch/past', to: 'lauch#past'
  get 'lauch/upcoming', to: 'lauch#upcoming'
  get 'lauch/latest', to: 'lauch#latest'
  get 'lauch/next', to: 'lauch#next'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
