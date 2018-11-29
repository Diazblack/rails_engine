class InvoiceItemsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :quantity, :unit_price
end
