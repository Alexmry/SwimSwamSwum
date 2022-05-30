class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    # get call as soon as there is a subscription made from a client

    stream_from "everyone"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
