require_relative '../../kata/underground/ticket'

class WeeklyTicket < Ticket

  def scan_at(time)
    super(time, "DISPLAY WEEKLY\nBEEP WEEKLY") do |times|
      times.last.year != times.first.year || times.last.cweek != times.first.cweek
    end
  end

end