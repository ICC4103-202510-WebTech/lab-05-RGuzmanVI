class Message < ApplicationRecord

    belongs_to :chat
  
    belongs_to :sender, class_name: 'User'

    belongs_to :receiver, class_name: "User"

    validates :body, presence: { message: "no puede estar vacío" }
  end