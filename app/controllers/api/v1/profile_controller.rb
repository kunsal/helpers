class Api::V1::ProfileController < AuthBaseController
  def index
    render json: {user: logged_in_user}, status: :ok
  end
end