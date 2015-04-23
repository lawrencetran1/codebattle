Rails.application.routes.draw do

	resources :challenges
	
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/users/:id' => 'users#show', as: :user

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/contact' => 'pages#contact'
  get '/help' => 'pages#help'
  get '/about' => 'pages#about'  
  root 'pages#index'
end
