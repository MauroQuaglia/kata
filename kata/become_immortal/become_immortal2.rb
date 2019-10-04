class BecomeImmortal2

  def elder_age(m, n, l, t)
    time = 0
    time = time + first_row_donation(n, l)
    time = time + first_column_donation(m, l)

    1.upto(m - 1) do |row|
      1.upto(n - 1) do |column|
        if column != row
          donation = positive_part((row ^ column) - l)
          time = time + donation
        end
      end
    end
    time.divmod(t).last
  end

  def positive_part(number)
    number > 0 ? number : 0
  end

  def first_row_donation(columns, loss)
    time = 0
    columns.times do |column|
      donation = positive_part(column - loss)
      time = time + donation
    end
    time
  end

  def first_column_donation(rows, loss)
    time = 0
    rows.times do |rows|
      donation = positive_part(rows - loss)
      time = time + donation
    end
    time
  end

end