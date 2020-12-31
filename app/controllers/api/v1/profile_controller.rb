class Api::V1::ProfileController < AuthBaseController
  def index
    render json: { name: 'Olakunle' }, status: :ok
  end
end