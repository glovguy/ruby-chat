Rails.application.routes.draw do
  resources :users
  resources :chat_rooms
  get '/chat', to: 'chat_client#show'
  namespace :api do
    resources :messages, only: [:index, :create]
  end
  get '/chat/messages', to: redirect('/api/messages')
  post '/chat/messages', to: redirect('/api/messages')

  mount ActionCable.server => '/cable'
end
