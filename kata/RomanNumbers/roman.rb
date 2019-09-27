class Roman

  def initialize
    @roman = {
        'I' => 1,
        'V' => 5,
        'X' => 10,
        'L' => 50,
        'C' => 100,
        'C' => 100,
        'D' => 500,
        'M' => 1000
    }
    @roman.default = 0
  end

  def to_decimal(r)
    sum = @roman[r[-1]]
    for i in 0...r.length-1
      sum += sign(r[i], r[i+1]) *@roman[r[i]]
    end
    sum
  end

  def to_decimal2(r)
    sum=0
    r.split(//).each_index { |i| sum += sign(r[i], r[i+1]) * @roman[r[i]] }
    sum
  end

  private

  def sign(first, second)
    @roman[first]-@roman[second]+1<=>0
  end

end