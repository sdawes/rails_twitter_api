Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  resources :followers
  # get 'welcome/index'
  root 'followers#index'
end
