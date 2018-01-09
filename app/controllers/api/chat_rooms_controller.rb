module Api
  class ChatRoomsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_chat_room, only: [:show]

    def show
      roomStatus = ChatRoomStatus.new(@chat_room, chat_stream_id)
      render json: roomStatus, serializer: ChatRoomStatusSerializer
    end

    private

    def set_chat_room
      @chat_room = ChatRoom.find(params[:id])
    end
  end
end
