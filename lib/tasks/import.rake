require 'CSV'

namespace :import do
  task merchants: :environment do
    path = "data/merchants.csv"
    CSV.foreach(path, headers: true) do |row|
      p row
    end
  end
end
