FactoryGirl.define do
  factory :token do
    name 'Great Web Service'
    secret 'shhh.....'
    user
  end
end