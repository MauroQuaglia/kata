class DailyTicket

  def initialize
    @times = []
  end

  def scan_at(time)
    @times << time
    @times.last.day - @times.first.day >= 1 ? message('KO') : message('OK')
  end

  private

  def message(value)
    "DISPLAY DAILY\nBEEP DAILY #{value}"
  end

end