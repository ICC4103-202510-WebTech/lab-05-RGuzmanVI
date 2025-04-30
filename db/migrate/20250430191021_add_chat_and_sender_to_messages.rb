class AddChatAndSenderToMessages < ActiveRecord::Migration[8.0]
  def change
    add_column :messages, :chat_id, :bigint
    add_column :messages, :sender_id, :bigint

    add_foreign_key :messages, :chats
    add_foreign_key :messages, :users, column: :sender_id
  end
end
