class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  def self.revenue(id)
    Merchant.select("merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue ")
            .joins(invoices: [:invoice_items, :transactions])
            .where(id: id)
            .merge(Transaction.successful)
            .group(:id)
            .first
            .revenue
  end
end
