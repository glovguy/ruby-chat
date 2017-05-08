Rails.application.routes.draw do
  resources :users
  resources :chat_bots
  get '/chat', to: 'chat_client#show'
  scope :chat do
    resources :messages, only: [:index, :create]
  end
  mount ActionCable.server => '/cable'
end
