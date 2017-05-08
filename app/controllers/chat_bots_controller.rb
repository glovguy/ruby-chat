class ChatBotsController < ApplicationController
  before_action :set_chat_bot, only: [:show, :edit, :update, :destroy]

  def index
    @chat_bots = ChatBot.all
  end

  def show
  end

  def new
    @chat_bot = ChatBot.new
  end

  def edit
  end

  def create
    @chat_bot = ChatBot.new(chat_bot_params)

    respond_to do |format|
      if @chat_bot.save
        format.html { redirect_to @chat_bot, notice: 'Chat bot was successfully created.' }
        format.json { render :show, status: :created, location: @chat_bot }
      else
        format.html { render :new }
        format.json { render json: @chat_bot.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @chat_bot.update(chat_bot_params)
        format.html { redirect_to @chat_bot, notice: 'Chat bot was successfully updated.' }
        format.json { render :show, status: :ok, location: @chat_bot }
      else
        format.html { render :edit }
        format.json { render json: @chat_bot.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @chat_bot.destroy
    respond_to do |format|
      format.html { redirect_to chat_bots_url, notice: 'Chat bot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat_bot
      @chat_bot = ChatBot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chat_bot_params
      params.require(:chat_bot).permit(:name, :location)
    end
end
