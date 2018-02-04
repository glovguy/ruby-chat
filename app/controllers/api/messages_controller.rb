module Api
  class MessagesController < ApplicationController
    before_action :set_messages, only: [:index]
    skip_before_action :verify_authenticity_token

    def index
      render json: @messages, each_serializer: MessagesSerializer
    end

    def create
      room = ChatRoom.first
      room.new_message(message_attributes)
      render json: { 'success' => 'message sent' }
    end

    private

    def set_messages
      if has_admin_password?
        @messages = Messages.all
      else
        @messages = Messages.where(updated_at: Time.now-2.week..Time.now, chat_stream_id: chat_stream_id)
      end
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
