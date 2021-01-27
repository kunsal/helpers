class ChatsChannel < ApplicationCable::Channel
  def subscribed
    @help = Help.find(params[:id]) 
    stream_for @help
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    data['help'] = @help.to_json(include: {:user => {only: [:first_name, :last_name]}})
    self.broadcast_to(@help, data)
  end
end
