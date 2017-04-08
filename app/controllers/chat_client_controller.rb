class ChatClientController < ApplicationController
  layout 'ng_inject'

  def client
    render 'chat_client/index.html.haml'
  end

end
