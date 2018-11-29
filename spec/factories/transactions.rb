FactoryBot.define do
  factory :transaction do
    invoice { "" }
    credit_card_number { "#{rand(1111_0000_0000_000..9999_9999_9999_9999)}" }
    credit_card_expiration_date { " " }
    result { "success" }
  end
end
