class Ticket

  def initialize
    @times = []
  end

  def scan_at(time, sound)
    yield(@times << time) ?
        sound.concat(' KO') : sound.concat(' OK')
  end

end