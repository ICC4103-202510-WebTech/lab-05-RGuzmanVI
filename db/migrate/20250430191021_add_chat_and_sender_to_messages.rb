class AddChatAndSenderToMessages < ActiveRecord::Migration[8.0]
  def change
    add_column :messages, :chat_id, :bigint
    add_column :messages, :sender_id, :bigint
  end
end
