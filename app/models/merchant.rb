class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  def self.single_revenue(id)
    Merchant.select("merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue ")
            .joins(invoices: [:invoice_items, :transactions])
            .where(id: id)
            .merge(Transaction.successful)
            .group(:id)
            .first
            .revenue
  end

  def self.favorite_customer(id)
    Customer.select('customers.*, COUNT(transactions.id) AS Customer_transactions')
            .joins(invoices: [:transactions])
            .merge(Transaction.successful)
            .where(invoices: {merchant_id: id})
            .group(:id)
            .order('Customer_transactions DESC')
            .limit(1)
            .first
  end
end
