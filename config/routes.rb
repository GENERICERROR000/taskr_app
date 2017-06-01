Rails.application.routes.draw do
  root 'application#home'

  resources :events

  resources :tasks
  get '/add_task/:id', to: 'tasks#add_task', as: 'add_task'
  post '/add_task/:id', to: 'tasks#add_task'
  get '/complete_task/:id', to: 'tasks#complete_task', as: 'complete_task'
  post '/complete_task/:id', to: 'tasks#complete_task'
  get '/remove_task/:id', to: 'tasks#remove_task', as: 'remove_task'
  post '/remove_task/:id', to: 'tasks#remove_task'

  resources :users, except: [:index]

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'
  delete '/signout', to: 'sessions#destroy'

end
