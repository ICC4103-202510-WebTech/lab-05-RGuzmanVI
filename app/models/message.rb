class Message < ApplicationRecord

    belongs_to :chat
  
    belongs_to :sender, class_name: 'User', foreign_key: :sender_id

    validates :body, presence: { message: "no puede estar vacío" }
  end