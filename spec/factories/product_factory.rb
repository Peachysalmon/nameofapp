FactoryBot.define do
  sequence(:id) {|n| "#{n}"}

  factory :product do
    id
    name "Bike"
    created_at "first day"
    updated_at "last day"
  end
end
