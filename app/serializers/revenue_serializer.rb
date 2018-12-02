class RevenueSerializer
  include FastJsonapi::ObjectSerializer
  attribute :revenue do |object|
      dolars = (object.number / 100.00)
      ('%.2f' % dolars)
    end
end
