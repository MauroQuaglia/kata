class BecomeImmortal4

  def elder_age(m, n, l, t)
    time = 0
    order = [m, n].min
    remaining = [m, n].max

    1.upto(order - 1) do |column|
      0.upto(column - 1) do |row|
        value = column ^ row
        if value > l
          time += 2 * (value - l)
          time = time.divmod(t).last
        end
      end
    end

    order.upto(remaining - 1) do |column|
      0.upto(order - 1) do |row|
        value = column ^ row
        if value > l
          time += (value - l)
          time = time.divmod(t).last
        end
      end
    end

    time
  end

end