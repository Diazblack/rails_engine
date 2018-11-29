FactoryBot.define do
  factory :invoice_item do
    item                  { " " }
    invoice               { " " }
    sequence :quantity   { |n| n }
    sequence :unit_price { rand(10..999999) }
  end
end
