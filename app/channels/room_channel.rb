class RoomChannel < ApplicationCable::Channel
  def subscribed
    # @room = Room.find_by(id: params[:room])
    # stream_from @room
    stream_from 'room_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    ActionCable.server.broadcast('room_channel', { content: data })
    # RoomChannel.broadcast_to(@room, {room: @room, users: @room.users, messages: @room.messages})
  end
end
