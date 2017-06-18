require "rails_helper"

RSpec.describe ChatRoom, :type => :model do
  let(:bot_user_id) { 3 }
  let(:room) { FactoryGirl.create(:chat_room, users_id: bot_user_id) }
  let!(:bot_user) { FactoryGirl.create(:user, id: bot_user_id) }
  let(:new_message) { FactoryGirl.create(:message) }
  let(:new_message_params) { {'body' => 'message content', 'sender' => bot_user_id} }

  it 'should create new chat room' do
    new_room = ChatRoom.new

    expect(new_room.save).to be true
  end

  context 'adds new message' do
    it 'should notify observers' do
      allow_any_instance_of(ChatRoom).to receive(:notify_observers)
      expect(room).to receive(:notify_observers)

      room.new_message(new_message_params)
    end
  end

  context 'notify_observers' do
    before do
      allow_any_instance_of(ChatRoom).to receive(:notify_bot)
      allow_any_instance_of(ChatRoom).to receive(:broadcast_message)
    end
    it 'should notify bots' do
      expect(room).to receive(:notify_bot)

      room.new_message(new_message_params)
    end

    it 'should notify bots' do
      expect(room).to receive(:broadcast_message)

      room.new_message(new_message_params)
    end
  end
end
