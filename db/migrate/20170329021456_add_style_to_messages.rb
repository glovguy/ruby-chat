class AddStyleToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :messages, :string
    add_column :messages, :style, :string
  end
end
