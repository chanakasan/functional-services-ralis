require 'csv'

module Service
  class GenerateCsv < ::Service::Base
    def self.call(headers, data_rows)
      CSV.generate(headers: true) do |csv|
        csv << headers
        data_rows.each { |row| csv << row }
      end
    end
  end
end
