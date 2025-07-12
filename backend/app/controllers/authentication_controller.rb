class AuthenticationController < ApplicationController
    # Skip authentication for register and login actions
    skip_before_action :authenticate_request, only: [:register, :login]
  
    # POST /register
    def register
      user = User.new(user_params) # Create a new user with permitted params
      if user.save
        render json: { message: 'User created successfully' }, status: :created
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # POST /login
    def login
      user = User.find_by(email: params[:email]) # Find user by email
      if user&.authenticate(params[:password])   # Authenticate password
        token = encode_jwt(user_id: user.id)     # Encode JWT with user_id
        render json: { token: token }, status: :ok
      else
        render json: { error: 'Invalid email or password' }, status: :unauthorized
      end
    end
  
    private
  
    # Strong parameters for user registration
    def user_params
      params.permit(:first_name, :last_name, :username, :email, :password)
    end
  
    # Encodes a JWT token with the custom secret key
    def encode_jwt(payload)
      JWT.encode(payload, jwt_secret_key)
    end
  
    # Fetches the JWT secret key from Rails credentials
    def jwt_secret_key
      Rails.application.credentials.jwt_secret_key
      # If you want to raise an error if the key is missing, use:
      # Rails.application.credentials.jwt_secret_key!
    end
  end
  