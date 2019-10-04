class BecomeImmortal1

  def elder_age(m, n, l, t)
    time = 0
    m.times do |row|
      n.times do |column|
        donation = positive_part((row ^ column) - l)
        time = time + donation
      end
    end
    time.divmod(t).last
  end

  def positive_part(number)
    number > 0 ? number : 0
  end

end