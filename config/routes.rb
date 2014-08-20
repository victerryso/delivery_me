Rails.application.routes.draw do
  root to: 'tasks#index'
  get '/tasks/search/:search' => 'tasks#search'
  put 'tasks/courier/:id' => 'tasks#courier'

  resources :tasks, :users

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

end
