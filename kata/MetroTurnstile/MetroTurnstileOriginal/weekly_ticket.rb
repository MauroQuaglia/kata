class WeeklyTicket

  def initialize
    @times = []
  end

  def scan_at(time)
    @times << time
    @times.last.year == @times.first.year && @times.last.cweek == @times.first.cweek ? message('OK') : message('KO')
  end

  private

  def message(value)
    "DISPLAY WEEKLY\nBEEP WEEKLY #{value}"
  end

end