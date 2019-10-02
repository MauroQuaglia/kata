class Decimal1

  def initialize
    @roman = {
        1000 => 'M',
        900 => 'CM',
        500 => 'D',
        400 => 'CD',
        100 => 'C',
        90 => 'XC',
        50 => 'L',
        40 => 'XL',
        10 => 'X',
        9 => 'IX',
        5 => 'V',
        4 => 'IV',
        1 => 'I'
    }

  end

  def to_roman(decimal)
    s = ''
    @roman.keys.sort.reverse.each do |item|
      result=decimal.divmod(item)
      s += @roman[item] * result[0]
      decimal = result[1]
    end
    s
  end

end
