class FizzBuzz

  def initialize
    @fizz_buzz = Hash.new
    @fizz_buzz[[3, 6, 9, 12]] = 'Fizz'
    @fizz_buzz[[5, 10]] = 'Buzz'
    @fizz_buzz[[0]] = 'FizzBuzz'
  end

  def for(value)
    @fizz_buzz.each_pair {|k, v| return v if k.include?(value.divmod(15).last)}
    value
  end

end