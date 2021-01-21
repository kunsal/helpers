class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    # current_user.appear
    # ActionCable.server.broadcast("appearance_channel_#{params[:id]}", { message: current_user.first_name + ' joined the room' })
    stream_from "appearance_channel_#{params[:id]}"

  end

  def unsubscribed
    current_user.disappear
  end

  def receive(data)
    p 'Appear called'
    data['username'] = current_user.first_name
    ActionCable.server.broadcast("appearance_channel_#{params[:id]}", data)
  end

  def away
    current_user.away
  end
end