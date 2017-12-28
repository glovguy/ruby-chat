class LinkMessagesToChatRoom < ActiveRecord::Migration[5.1]
  def change
    add_reference :messages, :chat_room, index: true
  end
end
