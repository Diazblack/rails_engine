FactoryBot.define do
  factory :item do
    sequence :name { |n| "Item #{n}" }
    sequence :description { |n| "this is so great #{n}" }
    sequence :unit_price { |n| 1.1 * n }
             merchant { nil }
  end
end
