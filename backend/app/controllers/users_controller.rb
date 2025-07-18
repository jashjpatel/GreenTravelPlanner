class UsersController < ApplicationController
    def profile
      render json: {
        message: "Welcome, #{@current_user.username}",
        user: @current_user.as_json(except: [:password_digest])
      }
    end
  end
  