class AddChatStreamToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :chat_stream_id, :string
  end
end
