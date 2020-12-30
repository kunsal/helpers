class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      data = {user_id: user.id}
      jwt = JWT.encode data, Rails.application.secret_key_base
      render json: {user: user, message: 'User created successfully', token: jwt}, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :government_id)
  end
end
