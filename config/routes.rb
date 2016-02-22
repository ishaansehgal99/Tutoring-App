Rails.application.routes.draw do

  # # Routes for the Article resource:
  # # CREATE
  # get '/new_article' => 'articles#new'
  # get '/create_article' => 'articles#create'

  # # READ
  # get '/articles' => 'articles#index'
  # get '/articles/:id' => 'articles#show'

  # # UPDATE
  # get '/articles/:id/edit' => 'articles#edit'
  # get '/articles/:id/update' => 'articles#update'

  # # DELETE
  # get '/articles/:id/destroy' => 'articles#destroy'
  # #------------------------------
  root to: 'application#home'
  get '/start' => 'application#start'
  get 'questions/:id/solve' => 'questions#solve'

  resources :users
  resources :sessions
  resources :questions
end
