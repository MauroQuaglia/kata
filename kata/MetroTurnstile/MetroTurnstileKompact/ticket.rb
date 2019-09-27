class Ticket

  def initialize(message, condition)
    @times = []
    @message = message
    @condition = condition
  end

  def scan_at(time)
    @times << time
    @condition.call(@times.last, @times.first) ? @message.call('OK') : @message.call('KO')
  end

end