require 'csv'

class GenerateUserDataService < BaseService
  attr_reader :start_date, :end_date

  EXPORT_LIMIT = 5

  def initialize(start_date, end_date)
    super()
    @start_date = start_date.to_datetime.beginning_of_day
    @end_date = end_date.to_datetime.end_of_day
  end

  def call
    generate_csv
  end

  private

  def generate_csv
    CSV.generate(headers: true) do |csv|
      csv << headers
      csv_data.each { |row| csv << row }
    end
  end

  def headers
    [
      'Name', 'E-Mail', 'Registered Date'
    ]
  end

  def csv_data
    User.where(created_at: start_date..end_date)
        .limit(EXPORT_LIMIT).map { |user| create_row(user) }
  end

  def create_row(user)
    [
      user&.full_name,
      user&.email,
      format_date(user&.created_at), 
    ]
  end
end
