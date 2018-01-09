class ChatRoomStatus
  include ActiveModel::Serialization

  attr_reader :id, :name, :user_id, :awake, :chat_stream_id

  def initialize(chatRoom, chat_stream_id)
    @id = chatRoom.id
    @name = chatRoom.name
    @user_id = chatRoom.user_id
    @awake = chatRoom.wake_up
    @chat_stream_id = chat_stream_id
  end
end
