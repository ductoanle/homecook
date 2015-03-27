FactoryGirl.define do
  factory :user do
    sequence(:username) {|n| "test_user_#{n}"}
    sequence(:email) {|n| "test_email_#{n}@viki.com"}
    password 'testing'
    password_confirmation 'testing'
  end
end
