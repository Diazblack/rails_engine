require 'csv'

namespace :import do
  
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

end
