class Api::V1::RoomsController < AuthBaseController
  def show
    @messages = Message.all
  end
end
