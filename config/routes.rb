Rails.application.routes.draw do
  resources :sessions, only: %i[new create destroy]
  
  resources :users, only: %i[new create]
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'sequences#main'
  post '/result', to: 'sequences#result'
end
