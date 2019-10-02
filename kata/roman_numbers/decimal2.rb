class Decimal2

  def initialize
    @r = %w(I IV V IX X XL L XC C CD D CM M)
    @d = [1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000]
  end

  def to_roman(decimal, roman='', i=@r.length-1)
    result = decimal.divmod(@d[i])
    roman += @r[i] * result.first
    i.zero? ? roman : to_roman(result.last, roman, i.pred)
  end

end
