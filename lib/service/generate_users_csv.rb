module Service
  class GenerateUsersCsv < ::Service::Base
    EXPORT_LIMIT = 5

    def self.call(start_date, end_date)
      headers = [
        'Name', 'E-Mail', 'Registered Date'
      ]
      start_date = start_date.to_datetime.beginning_of_day
      end_date = end_date.to_datetime.end_of_day
      rows = User.where(created_at: start_date..end_date)
            .limit(EXPORT_LIMIT).map { |user| create_row(user) }
      AppServices.generate_csv(headers, rows)
    end

    def self.create_row(user)
      [
        user&.full_name,
        user&.email,
        format_date(user&.created_at), 
      ]
    end

    private_class_method :create_row
  end
end
