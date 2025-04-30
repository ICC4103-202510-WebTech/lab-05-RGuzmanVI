class AddSenderAndReceiverToChats < ActiveRecord::Migration[8.0]
  def change
    add_column :chats, :sender_id, :bigint unless column_exists?(:chats, :sender_id)
    add_column :chats, :receiver_id, :bigint unless column_exists?(:chats, :receiver_id)

    add_foreign_key :chats, :users, column: :sender_id unless foreign_key_exists?(:chats, column: :sender_id)
    add_foreign_key :chats, :users, column: :receiver_id unless foreign_key_exists?(:chats, column: :receiver_id)
  end
end
