FactoryGirl.define do
  factory :message, class: Messages do
    body 'my text body'
    sender 3
    style 'bot'
  end
end
