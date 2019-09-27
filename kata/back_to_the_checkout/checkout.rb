class Checkout
  attr_reader :total

  def initialize(rules)
    @rules = rules
    @total = 0
  end

  def scan(item)
    @total += @rules[item].rotate!.last
  end

end