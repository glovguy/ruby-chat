class MessagesSerializer < ActiveModel::Serializer
  attributes :id, :body, :sender, :style, :chat_stream_id
end
