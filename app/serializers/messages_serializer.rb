class MessagesSerializer < ActiveModel::Serializer
  attributes :id, :body, :sender, :style
end
