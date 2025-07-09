# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def create
    Rails.logger.debug "Received parameters: #{params.inspect}"
    @user = User.new(user_params)
    if @user.save
      # Success logic
      render json: { message: "User created successfully" }, status: :created
    else
      Rails.logger.debug "Validation errors: #{@user.errors.full_messages}"
      # Error handling
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
