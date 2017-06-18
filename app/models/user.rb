class User < ApplicationRecord
  belongs_to :chat_rooms, optional: true
end
