class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  	puts 'messages requested'
    messages = Message.all
    render json: messages
  end

  def create
  	puts 'suddenly a controller appeared'
    puts params
    ActionCable.server.broadcast('chat', { 'content' => 'message here' }.as_json.merge(action: 'newMessage'))
  end
end
