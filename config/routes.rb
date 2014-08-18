Rails.application.routes.draw do
  root to: 'tasks#index'

  resources :tasks, :users

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

end
