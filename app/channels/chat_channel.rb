class ChatChannel < ApplicationCable::Channel
  def subscribed
    ChatRoom.first.wake_up
    stream_from "chat_#{params[:chat_stream_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
