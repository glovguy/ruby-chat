require 'net/http'

class ChatRoom < ApplicationRecord
  has_one :user

  def new_message(message_attributes)
    sender = User.find(message_attributes['sender'])
    new_message = Messages.create(message_attributes)
    notify_observers(new_message)
  end

  private

  def notify_observers(new_message)
    broadcast_message new_message
    notify_bot new_message
  end

  def notify_bot(message)
    url = URI.parse(location.to_s)
    message_json = message.as_json
    begin
      response = Net::HTTP.post_form(url, message_json)
    rescue Timeout::Error, Errno::EINVAL, Errno::ECONNRESET, EOFError, Errno::ECONNREFUSED,
        Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError, Net::ProtocolError => e
      puts "Error notifying bot at #{location}"
    end
  end

  def broadcast_message(message)
    ActionCable.server.broadcast('chat', message.as_json.merge(action: 'newMessage'))
  end
end
