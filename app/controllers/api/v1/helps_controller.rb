class Api::V1::HelpsController < AuthBaseController
  def create
    @help = Help.create(help_params)
    if @help.save
      render json: @help, status: :created
    else
      render json: @help.errors, status: :unprocessable_entity
    end
  end

  private def help_params
    params.permit(:title, :description, :category_id, :location, :status, :user_id)
  end
end