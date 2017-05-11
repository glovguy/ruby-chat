class ChatBotSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :user_id
end
