FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }
    email { Faker::Internet.safe_email(username) }
    password { Faker::Internet.password }
    password_confirmation { password }
  end
end
