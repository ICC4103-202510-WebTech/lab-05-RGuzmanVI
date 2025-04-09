# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Users
10.times do |i|
    User.create!(
      email: "user#{i}@example.com",
      first_name: "First#{i}",
      last_name: "Last#{i}"
    )
  end
  
  # Chats
  10.times do
    Chat.create!(
      sender_id: User.pluck(:id).sample,
      receiver_id: User.pluck(:id).sample
    )
  end
  
  # Messages
  10.times do
    Message.create!(
      chat_id: Chat.pluck(:id).sample,
      user_id: User.pluck(:id).sample,
      body: "Hello, this is a test message."
    )
  end
  