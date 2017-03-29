class ChatClientController < ApplicationController
  layout 'ng_inject'

  def client
    render 'chat_client/index.html.haml'
  end

  def messages
    messages = Message.all
    render json: messages
  end

end
