Rails.application.routes.draw do
  post '/register', to: 'authentication#register'
  post '/login', to: 'authentication#login'

  # routing for the protected route
  get '/profile', to: 'users#profile'
end
