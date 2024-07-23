class PagesController < ApplicationController
  def home
    @result_one = GenerateUserDataService.call(Date.current - 7.days, Date.current) 
    @result_two = AppServices.generate_users_csv(Date.current - 7.days, Date.current)
  end
end
