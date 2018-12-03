require 'csv'

namespace :import do

  desc "import Data from csv file"
  task seeds: :environment do
    data_hash = {  "Merchant" => ["data/merchants.csv", Merchant],
              "Customer" => ["data/customers.csv", Customer],
              "Items" => ["data/items.csv", Item],
              "Invoice" => ["data/invoices.csv", Invoice],
              "Transactions" => ["data/transactions.csv", Transaction],
              "InvoiceItem" => ["data/invoice_items.csv", InvoiceItem],


    }

    data_hash.each do |key, array|

      CSV.foreach(array[0], headers: true) do |row|
        array[1].create(row.to_h)
      end
      puts "There Are #{array[1].count} #{key} in the Database."
    end
  end

end
