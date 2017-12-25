Rails.application.routes.draw do
  resources :users
  resources :chat_rooms
  get '/', to: redirect('/chat')
  get '/chat', to: 'chat_client#show'
  namespace :api do
    resources :messages, only: [:index, :create]
  end

  mount ActionCable.server => '/cable'
end
