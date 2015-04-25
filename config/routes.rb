Rails.application.routes.draw do

  get '/challenges' => 'challenges#check_solution', as: :check_solution

  resources :users
	resources :challenges
	
  get '/signup' => 'users#new'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/contact' => 'pages#contact'
  get '/help' => 'pages#help'
  get '/about' => 'pages#about'  
  root 'pages#index'
end
