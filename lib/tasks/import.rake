require 'csv'

namespace import: :environment do

  desc "import Merchants from csv file"
  task merchants: :environment do
    path = "data/merchants.csv"
    CSV.foreach(path, headers: true) do |row|
      Merchant.create(row.to_h)
    end
    puts "There Are #{Merchant.count} Merchants in the Database."
  end

  desc "import customers from csv file"
  task customers: :environment do
    path = "data/customers.csv"
    CSV.foreach(path, headers: true) do |row|
      Customer.create(row.to_h)
    end
    puts "There Are #{Customer.count} Customers in the Database."
  end

  desc "import Items from csv file"
  task items: :environment do
    path = "data/items.csv"
    CSV.foreach(path, headers: true) do |row|
      Item.create(row.to_h)
    end
    puts "There Are #{Item.count} Items in the Database."
  end

  desc "import Invoices from csv file"
  task invoices: :environment do
    path = "data/invoices.csv"
    CSV.foreach(path, headers: true) do |row|
      Invoice.create(row.to_h)
    end
    puts "There Are #{Invoice.count} Invoices in the Database."
  end

  desc "import Transactions from csv file"
  task invoices: :environment do
    path = "data/transactions.csv"
    CSV.foreach(path, headers: true) do |row|
      Transaction.create(row.to_h)
    end
    puts "There Are #{Transaction.count} Transactions in the Database."
  end

  desc "import Invoice Items from csv file"
  task invoice_items: :environment do
    path = "data/transactions.csv"
    CSV.foreach(path, headers: true) do |row|
      InvoiceItems.create(row.to_h)
    end
    puts "There Are #{InvoiceItems.count} Invoice Items in the Database."
  end
end
