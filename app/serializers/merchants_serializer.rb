class MerchantsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :id
end
