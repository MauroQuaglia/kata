class Product
  attr_reader :price

  def initialize(description, price, rate)
    @description = description
    @price = price
    @rate = rate
  end

  def description
    description_token = @description.split(' ')
    description_token.insert(1, description_token.delete('imported')).compact.join(' ')
  end

  def taxes
    @price * @rate * 0.01
  end

end
