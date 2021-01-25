class Api::V1::HelpsController < AuthBaseController
  def index
    @helps = Help.includes(:user, :category)
    render json: @helps.as_json(include: {:user => {except: :password_digest}, :category => {only: [:name, :color]}}), status: :ok
  end

  def create
    @help = logged_in_user.helps.create(help_params)
    if @help.save
      render json: @help, status: :created
    else
      render json: @help.errors, status: :unprocessable_entity
    end
  end

  def me
    @helps = logged_in_user.helps
    render json: @helps.as_json(include: {:category => {only: [:name, :color]}}), status: :ok
  end

  private def help_params
    params.permit(:title, :description, :category_id, :location, :status, :user_id)
  end
end