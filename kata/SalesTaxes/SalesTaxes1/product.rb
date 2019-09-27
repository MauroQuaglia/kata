class Product
  attr_reader :description, :price

  def initialize(description, price, rate)
    @description = description
    @price = price
    @rate = rate
  end

  def taxes
    @price * @rate * 0.01
  end

end
