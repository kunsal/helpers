class Api::V1::HelpsController < AuthBaseController
  def index
    @help = Help.all
    # @user = @help.user
    puts @help.inspect
    render json: @help, status: :ok
  end

  def create
    @help = logged_in_user.helps.create(help_params)
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