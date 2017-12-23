class ChatChannel < ApplicationCable::Channel
  def subscribed
    ChatRoom.find(params[:bot_id]).wake_up
    stream_from 'chat'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
