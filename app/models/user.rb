class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages, foreign_key: :sender_id

  has_many :sent_chats, class_name: 'Chat', foreign_key: :sender_id

  has_many :received_chats, class_name: 'Chat', foreign_key: :receiver_id

  has_many :sent_messages, class_name: "Message", foreign_key: :sender_id

  has_many :received_messages, class_name: "Message", foreign_key: :receiver_id

  has_many :received_messages, through: :received_chats, source: :messages

  validates :email, presence: { message: "no puede estar vacío" }, uniqueness: true

  def full_name
  "#{first_name} #{last_name}"
  end

end
