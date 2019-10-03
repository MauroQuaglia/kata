class FakeReceipt
  attr_reader :description, :taxes, :total

  def initialize
    @description = ''
    @taxes = -1
    @total = -1
  end

  def add(description, price)
    @description = description
  end

  def add_taxes(taxes)
    @taxes = taxes
  end

  def add_total(total)
    @total = total
  end

  def print
  end

end
