class Api::V1::MessagesController < AuthBaseController
  def index
    messages = Message.all
    render json: messages
  end

  def create
    message = Message.new message_params
    room = Room.find message_params['room_id']
    if message.save
      p 'successfully saved a message!'
      RoomChannel.broadcast_to(room, {
        room: RoomSerializer.new(room),
        users: UserSerializer.new(room.users),
        messages: MessageSerializer.new(room.messages)
      })
    end
    render json: MessageSerializer.new(message)
  end

  private

  def message_params
    params.require(:message).permit(:content, :user_id, :room_id)
  end
end