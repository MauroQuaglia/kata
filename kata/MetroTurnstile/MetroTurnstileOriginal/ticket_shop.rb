require_relative 'one_way_ticket'
require_relative 'daily_ticket'
require_relative 'weekly_ticket'

class TicketShop

  def initialize
    @tickets=Hash.new
    @tickets['ONEWAY']=OneWayTicket.new
    @tickets['DAILY']= DailyTicket.new
    @tickets['WEEKLY']= WeeklyTicket.new
  end

  def get(type)
    @tickets[type]
  end

end