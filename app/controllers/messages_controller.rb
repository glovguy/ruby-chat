class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    messages = Messages.all
    render json: messages, each_serializer: MessagesSerializer
  end

  def create
    new_message = Messages.new(message_attributes)

    if new_message.save
      ActionCable.server.broadcast('chat', new_message.as_json)
    else
      render json: { 'error' => 'invalid request' }
    end
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
