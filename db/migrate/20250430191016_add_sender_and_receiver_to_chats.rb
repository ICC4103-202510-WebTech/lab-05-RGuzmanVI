class AddSenderAndReceiverToChats < ActiveRecord::Migration[8.0]
  def change
    add_column :chats, :sender_id, :bigint
    add_column :chats, :receiver_id, :bigint

    add_foreign_key :chats, :users, column: :sender_id
    add_foreign_key :chats, :users, column: :receiver_id
  end
end
