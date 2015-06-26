FactoryGirl.define do
  factory :token do
    name "Great Web Service"
    secret ROTP::Base32.random_base32
    user
  end
end
