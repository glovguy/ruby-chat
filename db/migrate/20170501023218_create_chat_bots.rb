class CreateChatBots < ActiveRecord::Migration[5.0]
  def change
    create_table :chat_bots do |t|
      t.string :name
      t.string :location
      t.references :users

      t.timestamps
    end

    add_index :chat_bots, :user_id
  end
end
