require 'rest-client'

class ChatRoom < ApplicationRecord
  has_one :user

  def new_message(message_attributes)
    message = Messages.create!(message_attributes)
    notify_observers(message)
  end

  def wake_up
    message = { reply_url: '', chat_stream_id: '', style: '' }
    @awake = true if http_message("#{location}/wake", message)
  end

  def awake
    @awake == true
  end

  private

  def notify_observers(message)
    broadcast_message message
    notify_bot message
  end

  def notify_bot(message)
    url = location.to_s
    reply_url = ENV['RUBY_CHAT_BASE_URL']
    message_json = message.as_json.merge(reply_url: reply_url)
    Rails.logger.info "Sending message to #{url}\n\tMessage being sent: #{message_json}"
    http_message(url, message_json)
  end

  def http_message(url, message_json)
    begin
      RestClient.post url, message_json
      return true
    rescue RestClient::ExceptionWithResponse => restError
      puts "Error notifying bot at #{location}"
      p restError
      return false
    rescue Errno::ECONNREFUSED => connError
      puts "Error connecting to bot at #{location}"
      p connError
      return false
    end
  end

  def broadcast_message(message)
    chat_stream_id = message.chat_stream_id
    puts "broadcasting to chat_#{chat_stream_id}"
    ActionCable.server.broadcast("chat_#{chat_stream_id}", message.as_json.merge(action: 'newMessage'))
  end
end
