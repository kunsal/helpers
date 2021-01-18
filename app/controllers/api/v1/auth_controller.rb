class Api::V1::AuthController < ApplicationController
  def login
    if params[:email].empty? || params[:password].empty?
      return render json: {message: 'Invalid login credentials'}, status: :unprocessable_entity
    end

    user = User.find_by_email(params[:email])

    if user &. authenticate(params[:password])
      expiry_date = (Time.now + 2.days).to_i
      payload = {user_id: user.id, exp: expiry_date, iat: Time.now.to_i}
      token = JWT.encode payload, Rails.application.secrets.secret_key_base, 'HS256'
      render json: {token: token}, status: :ok
    else
      render json: {message: 'Invalid login credentials'}, status: :unauthorized
    end
  end

end
