FactoryBot.define do
  sequence(:email) {|n| "user#{n}@gmail.com"}

  factory :user do
    email
    password "123456"
    first_name "Ben"
    last_name "Example"
    admin false
  end

  factory :admin do
    email
    password "654321"
    first_name "Admin"
    last_name "User"
    admin true
  end
end
