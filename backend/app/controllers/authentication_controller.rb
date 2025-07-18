class AuthenticationController < ApplicationController
    wrap_parameters false
    skip_before_action :authenticate_request, only: [:register, :login]
  
    # handles any post requests coming in for registering of new user
    def register
      user = User.new(user_params)
      if user.save
        token = encode_token({ user_id: user.id.to_s })
        render json: { message: 'User registered successfully', token: token }, status: :created
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # handles any post requests coming in for logging in of existing user
    def login
      user = User.find_by(email: params[:email])
      if user&.authenticate(params[:password])
        token = encode_token({ user_id: user.id.to_s })
        render json: { token: token }, status: :ok
      else
        render json: { error: 'Invalid email or password' }, status: :unauthorized
      end
    end
  
    private
  
    def user_params
      params.permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
    end
  end
  