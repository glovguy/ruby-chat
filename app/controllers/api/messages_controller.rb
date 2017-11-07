module Api
  class MessagesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
      messages = Messages.where(updated_at: Time.now-2.week..Time.now)
      render json: messages, each_serializer: MessagesSerializer
    end

    def create
      room = ChatRoom.first
      room.new_message(message_attributes)
      render json: { 'success' => 'message sent' }
    end

    private

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
end
