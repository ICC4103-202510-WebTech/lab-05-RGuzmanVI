class AddSenderAndReceiverToMessages < ActiveRecord::Migration[8.0]
  def change
    add_column :messages, :sender_id, :bigint
    add_column :messages, :receiver_id, :bigint
  end
end
