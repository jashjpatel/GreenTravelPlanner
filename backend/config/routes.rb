Rails.application.routes.draw do
  get '/health', to: proc { [200, {}, ['OK']] }
  root to: proc { [200, {}, ['Green Travel Planner API is running!']] }
  
  # requests to /api are proxied here 
  scope '/api' do
    post '/register', to: 'authentication#register'
    post '/login', to: 'authentication#login'
    get '/profile', to: 'users#profile'
  end
end