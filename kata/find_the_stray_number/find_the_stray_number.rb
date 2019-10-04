class FindTheStrayNumber

  def stray(numbers)
    numbers.select {|number| numbers.count(number) == 1}.first
  end

end