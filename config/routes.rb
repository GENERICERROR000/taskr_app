Rails.application.routes.draw do
  root 'application#home'
  resources :events
  resources :tasks, except: [:new, :create]
  post '/tasks', to: 'tasks#create', as: 'new_task'
  resources :users, except: [:index]
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

end
