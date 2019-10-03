require_relative '../../kata/underground/ticket'

class DailyTicket < Ticket

  def scan_at(time)
    super(time, "DISPLAY DAILY\nBEEP DAILY") do |times|
      times.last.day - times.first.day >= 1
    end
  end

end