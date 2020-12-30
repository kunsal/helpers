class Api::V1::AuthController < ApplicationController
  def login
    @user = User.find_by_email(params[:email])
    puts(@user.inspect)
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
