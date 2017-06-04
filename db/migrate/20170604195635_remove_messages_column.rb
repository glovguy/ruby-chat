class RemoveMessagesColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :messages, :messages
  end
end
