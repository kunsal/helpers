class Api::V1::AuthController < ApplicationController
  def login
    if params[:email].empty? || params[:password].empty?
      return render json: {message: 'Invalid login credentials'}, status: :unprocessable_entity
    end
    user = User.find_by_email(params[:email])

    if user &. authenticate(params[:password])
      payload = {user_id: user.id}
      token = JWT.encode payload, Rails.application.secrets.secret_key_base, 'HS256'
      expiry_date = Time.now + 2.days.to_i
      render json: {token: token, exp: expiry_date.strftime("%m-%d-%Y %H:%M")}
    else
      render json: {message: 'Invalid login credentials'}, status: :unauthorized
    end
  end

end
