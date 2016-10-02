Rails.application.routes.draw do
  # match the twitter call back path and point it to some controller action
  get '/auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('welcome#index')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  # get 'welcome/index'
  root 'welcome#index'

end
