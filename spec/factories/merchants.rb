FactoryBot.define do
  factory :merchant do
    sequence :name { |n| "Merchant #{n}" }
    created_at    { Time.now}
    updated_at   { Time. now}
  end
end
