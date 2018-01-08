class ChatRoomsSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id, :awake
end
