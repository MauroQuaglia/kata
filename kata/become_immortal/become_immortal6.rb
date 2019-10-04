class BecomeImmortal6

  def elder_age(m, n)
    row, column = [m, n].sort
    max_power = 2 ** max_power(column)


    a = row * sigma(max_power)
    b = (positive_part(row - max_power) + positive_part(column - max_power)) * (sigma(column) - sigma(max_power))


  end

  def max_power(number)
    number.to_s(2).size - 1
  end

  def sigma(number)
    number < 1 ? 0 : ((number - 1) * number) / 2
  end

  def positive_part(number)
    number > 0 ? number : 0
  end

  def elder_age_test(m, n)
    time = 0
    m.times do |row|
      n.times do |column|
        time = time + (row ^ column)
      end
    end
    time
  end

end