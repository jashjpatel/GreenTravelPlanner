class ApplicationController < ActionController::API
    before_action :authenticate_request
  
    attr_reader :current_user
  
    private
  
    def authenticate_request
      # extract token
      header = request.headers['Authorization']
      token = header.split(' ').last if header
      
      # couldn't find the token
      if token.blank?
        render json: { error: 'Unauthorized: No token provided' }, status: :unauthorized
        return
      end
      
      begin
        # decode and verify the token
        decoded = JWT.decode(token, jwt_secret_key, true, algorithm: 'HS256')
        user_id = decoded[0]['user_id']
        @current_user = User.find(user_id)
      # error handling if user is unauthorized  
      rescue JWT::DecodeError => e
        render json: { error: "Unauthorized: #{e.message}" }, status: :unauthorized
      rescue Mongoid::Errors::DocumentNotFound
        render json: { error: 'Unauthorized: User not found' }, status: :unauthorized
      end
    end

    # tokens expire in 24 hours
    def encode_token(payload)
      payload[:exp] = 24.hours.from_now.to_i
      JWT.encode(payload, jwt_secret_key, 'HS256')
    end
  
    def jwt_secret_key
      # set up the secret key for jwt
      Rails.application.credentials.jwt_secret_key
    end
  end
  