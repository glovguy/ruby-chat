require 'test_helper'

class ChatBotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chat_bot = chat_bots(:one)
  end

  test "should get index" do
    get chat_bots_url
    assert_response :success
  end

  test "should get new" do
    get new_chat_bot_url
    assert_response :success
  end

  test "should create chat_bot" do
    assert_difference('ChatBot.count') do
      post chat_bots_url, params: { chat_bot: { location: @chat_bot.location, name: @chat_bot.name } }
    end

    assert_redirected_to chat_bot_url(ChatBot.last)
  end

  test "should show chat_bot" do
    get chat_bot_url(@chat_bot)
    assert_response :success
  end

  test "should get edit" do
    get edit_chat_bot_url(@chat_bot)
    assert_response :success
  end

  test "should update chat_bot" do
    patch chat_bot_url(@chat_bot), params: { chat_bot: { location: @chat_bot.location, name: @chat_bot.name } }
    assert_redirected_to chat_bot_url(@chat_bot)
  end

  test "should destroy chat_bot" do
    assert_difference('ChatBot.count', -1) do
      delete chat_bot_url(@chat_bot)
    end

    assert_redirected_to chat_bots_url
  end
end
