class ItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :description, :merchant_id

  attributes :unit_price do |object|
    (object.unit_price / 100.00).to_s  
  end
end
