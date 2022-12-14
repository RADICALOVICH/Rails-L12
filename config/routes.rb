Rails.application.routes.draw do
  resource :session, only: %i[new create destroy]
  
  resources :users, only: %i[new create edit update]
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'sequences#main'
  post '/result', to: 'sequences#result'
end
