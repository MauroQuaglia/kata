require_relative '../../kata/underground/one_way_ticket'
require_relative '../../kata/underground/daily_ticket'
require_relative '../../kata/underground/weekly_ticket'

class TicketShop

  TICKETS = {
      ONEWAY: OneWayTicket.new,
      DAILY: DailyTicket.new,
      WEEKLY: WeeklyTicket.new,
  }

  def self.buy(type)
    TICKETS[type]
  end

end