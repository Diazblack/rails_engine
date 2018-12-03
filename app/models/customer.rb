class Customer < ApplicationRecord
  has_many :invoices

  def self.favorite_merchant(id)
    Merchant.select('merchants.*, COUNT(transactions.id) AS Merchant_transactions')
            .joins(invoices: [:transactions])
            .merge(Transaction.successful)
            .where(invoices: {customer_id: id})
            .group(:id)
            .order('Merchant_transactions DESC')
            .limit(1)
            .first
  end
end
