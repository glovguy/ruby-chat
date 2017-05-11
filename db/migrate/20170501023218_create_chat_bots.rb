class CreateChatBots < ActiveRecord::Migration[5.0]
  def change
    create_table :chat_bots do |t|
      t.string :name
      t.string :location
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
