require_relative '../lib/ound/lib/ticket'

class OneWayTicket < Ticket

  def scan_at(time)
    super(time, 'BEEP') do |times|
      times.last.to_time - times.first.to_time >= 72 * 60
    end
  end

end