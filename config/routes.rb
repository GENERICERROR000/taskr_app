Rails.application.routes.draw do
  get 'errors/not_found'

  get 'errors/internal_server_error'

  root 'application#home'

  get 'about/', to: 'application#about'
  resources :events

  resources :tasks, except: [:index]
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

  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

end
