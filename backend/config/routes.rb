Rails.application.routes.draw do
  # Health check for ELB - returns 200 OK
  get '/health', to: proc { [200, {}, ['OK']] }
  
  # requests to /api are proxied here 
  scope '/api' do
    post '/register', to: 'authentication#register'
    post '/login', to: 'authentication#login'
    get '/profile', to: 'users#profile'
  end
end