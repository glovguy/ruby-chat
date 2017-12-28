module Api
  class MessagesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
      messages = Messages.where(updated_at: Time.now-2.week..Time.now, chat_stream_id: chat_stream_id)
      render json: messages, each_serializer: MessagesSerializer
    end

    def create
      room = ChatRoom.first
      room.new_message(message_attributes)
      render json: { 'success' => 'message sent' }
    end

    private

    def chat_stream_id
      session[:chat_stream_id] ||= SecureRandom.uuid
    end

    def message_params
      params.require(:data).permit(
        attributes: [:body, :style, :sender, :chat_stream_id]
        )
    end

    def message_attributes
      attributes = { 'sender' => 1, 'style' => 'user', 'chat_stream_id' => chat_stream_id }
      attributes = attributes.merge(message_params[:attributes] || {})
    end
  end
end
