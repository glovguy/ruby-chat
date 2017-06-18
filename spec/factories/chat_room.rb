FactoryGirl.define do
  factory :chat_room, class: ChatRoom do
    name 'my chatroom'
    location 'http://localhost:3000/chatbot/talk'
  end
end
