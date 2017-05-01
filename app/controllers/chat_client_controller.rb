class ChatClientController < ApplicationController
  layout 'ng_inject'

  def show
    render 'chat_client/index.html.haml'
  end

end
