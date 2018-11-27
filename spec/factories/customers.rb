FactoryBot.define do
  factory :customer do
    sequence :first_name { |n| "First_name#{n}" }
    sequence :last_name { |n| "Last_name#{n}" }
  end
end
