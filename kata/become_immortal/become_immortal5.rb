class BecomeImmortal5

  def elder_age(m, n, l, t)
    time = 0
    order = [m, n].min
    remaining = [m, n].max

    1.upto(order - 1) do |column|
      0.upto(column - 1) do |row|
        value = column ^ row
        logging(row, column, value)
=begin
        if value > l
          time += 2 * (value - l)
          time = time.divmod(t).last
        end
=end
      end
    end

=begin
    order.upto(remaining - 1) do |column|
      0.upto(order - 1) do |row|
        value = column ^ row
        if value > l
          time += (value - l)
          time = time.divmod(t).last
        end
      end
    end
=end

    time
  end

  private

  def logging(row, column, value)
    puts("row: #{row} - column: #{column} - value: #{value}")
  end

end