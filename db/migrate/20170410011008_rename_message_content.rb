class RenameMessageContent < ActiveRecord::Migration[5.0]
  def change
    rename_column :messages, :content, :body
  end
end
