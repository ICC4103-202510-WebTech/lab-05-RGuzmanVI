class Chat < ApplicationRecord

    has_many :messages
  
    belongs_to :sender, class_name: 'User', foreign_key: :sender_id
  
    belongs_to :receiver, class_name: 'User', foreign_key: :receiver_id


    validates :sender_id, presence: { message: "no puede estar vacío" }
    validates :receiver_id, presence: { message: "no puede estar vacío" }
    validate :sender_and_receiver_must_be_different

    private

    def sender_and_receiver_must_be_different
      if sender_id == receiver_id
        errors.add(:receiver_id, "debe ser diferente del remitente")
      end
  end
