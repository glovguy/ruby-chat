class Messages < ApplicationRecord
	validates :body, presence: true, length: {minimum: 2, maximum: 1000}
	validates :sender, presence: true
  has_one :chat_room
end
