class AddChatAndSenderToMessages < ActiveRecord::Migration[8.0]
  def change
    add_column :messages, :chat_id, :bigint unless column_exists?(:messages, :chat_id)
    add_column :messages, :user_id, :bigint unless column_exists?(:messages, :user_id)

    add_foreign_key :messages, :chats, column: :chat_id unless foreign_key_exists?(:messages, column: :chat_id)
    add_foreign_key :messages, :users, column: :user_id unless foreign_key_exists?(:messages, column: :user_id)
  end
end
