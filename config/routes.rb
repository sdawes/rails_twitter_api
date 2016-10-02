Rails.application.routes.draw do
  # match the twitter call back path and point it to some controller action
  get '/auth/:provider/callback', to: 'sessions#create'
  resources :followers
  # get 'welcome/index'
  root 'welcome#index'
end
