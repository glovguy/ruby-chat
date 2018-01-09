class ChatRoomStatusSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id, :awake, :chat_stream_id
end
