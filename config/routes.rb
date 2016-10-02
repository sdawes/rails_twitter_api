Rails.application.routes.draw do
  resources :followers
  get 'welcome/index'
  root 'welcome#index'
end
