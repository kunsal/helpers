class HelpsChannel < ApplicationCable::Channel
  def subscribed
    @helps = Help.includes :user, :category
    stream_for @help
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
