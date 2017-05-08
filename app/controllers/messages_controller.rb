require "uri"
require "net/http"

class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    messages = Messages.all
    render json: messages, each_serializer: MessagesSerializer
  end

  def create
    new_message = Messages.new(message_attributes)
    render json: { 'error' => 'invalid request' } unless new_message.save
    ActionCable.server.broadcast('chat', new_message.as_json.merge(action: 'newMessage'))

    message_json = render json: new_message, serializer: MessagesSerializer
    puts message_json
    x = Net::HTTP.post(URI.parse('/post_test'), message_json)
    puts x.body

    render json: { 'success' => 'message sent' }
  end

  def message_params
    params.require(:data).permit(
      attributes: [:body, :style, :sender]
      )
  end

  def message_attributes
    attributes = { 'sender' => 1, 'style' => 'user' }
    attributes = attributes.merge(message_params[:attributes] || {})
  end
end
