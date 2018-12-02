class InvoiceItemsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :item_id, :invoice_id, :quantity

  attributes :unit_price do |object|
    (object.unit_price / 100.00).to_s
  end
end
