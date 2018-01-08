module Api
  class ChatRoomsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_chat_room, only: [:show]

    def show
      @chat_room.wake_up
      render json: @chat_room, serializer: ChatRoomsSerializer
    end

    private

    def set_chat_room
      @chat_room = ChatRoom.find(params[:id])
    end
  end
end
