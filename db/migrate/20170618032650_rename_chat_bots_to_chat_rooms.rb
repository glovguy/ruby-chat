class RenameChatBotsToChatRooms < ActiveRecord::Migration[5.0]
  def change
    rename_table :chat_bots, :chat_rooms
    add_reference :chat_rooms, :users, index: true
    remove_reference :user, :chat_rooms
    remove_reference :chat_rooms, :user
  end
end
