class GettingAlongWithIntegerPartitions

  def part(n)
    prod = prod(n)
    "Range: #{range(prod)} Average: #{average(prod)} Median: #{median(prod)}"
  end

  def prod(n)
    enum(n).map {|partition| partition.reduce(:*)}.uniq.sort
  end

  # Questa è più elegante ma non soddisfa il test della performance.
  def enum2(n)
    result = [[n]]
    (n - 1).downto(1) do |value|
      result.concat(sum(value, enum(n - value)))
    end
    result
  end

  def enum(n)
    partitions = {}
    partitions[1] = [[1]]
    2.upto(n) do |value|
      partitions[value] = partition(value, partitions)
    end
    partitions[n]
  end

  def partition(n, previous)
    result = [[n]]
    (n - 1).downto(1) do |value|
      result.concat(sum(value, previous[n - value]))
    end
    result
  end

  def range(sorted)
    sorted.max - sorted.min
  end

  def average(sorted)
    sprintf('%.2f', Rational(sorted.sum, sorted.count))
  end

  def median(sorted)
    count = sorted.count
    sprintf('%.2f', count.odd? ? sorted[count / 2] : Rational(sorted[count / 2] + sorted[(count / 2) - 1], 2))
  end

  def sum(number, partitions)
    result = []
    partitions.each do |partition|
      result << ([number] + partition) if (number >= partition.first)
    end
    result
  end

end


