class AppServices
  def self.generate_csv(*, **)
    ::Service::GenerateCsv.call(*, **)
  end

  def self.generate_users_csv(*, **)
    ::Service::GenerateUsersCsv.call(*, **)
  end
end
