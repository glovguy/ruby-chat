Rails.application.routes.draw do
  get '/chat', to: 'chat_client#show'
  scope :chat do
    resources :messages, only: [:index, :create]
  end
  mount ActionCable.server => '/cable'
end
