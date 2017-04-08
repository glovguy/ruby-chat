Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/chat', to: 'chat_client#client'
  scope :chat do
    resources :messages, only: [:index, :create]
  end
  mount ActionCable.server => '/cable'
end
