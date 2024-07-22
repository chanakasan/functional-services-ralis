module ApplicationHelper
  def format_date(date)
    date.strftime('%d.%m.%Y')
  rescue StandardError
    ''
  end

  def format_time(time)
    time.strftime('%a, %d %b %Y')
  rescue StandardError
    ''
  end
end
