class FavoriteMerchantSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :id
end
