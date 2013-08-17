# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :message do
    content "MyString"
    author "MyString"
    kind "test"
    visible true
    message_timestamp { Time.now }
  end

  factory :sms, parent: :message do
    author "+614" + Random.rand.to_s[2..9]
    kind "sms"
  end

  factory :tweet, parent: :message do
    kind "tweet"
    url "http://www.example.com/user/" + Random.rand.to_s[2..5] + "/tweet/" + Random.rand.to_s[2..8]
  end
  
end
