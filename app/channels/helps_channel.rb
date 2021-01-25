class HelpsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "helps_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
