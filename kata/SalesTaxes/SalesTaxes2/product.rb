class Product
  attr_reader :price

  def initialize(description, price, rate)
    @description = description
    @price = price
    @rate = rate
  end

  def description
    key = 'imported'
    if @description.downcase.include? key
      return @description.split(' ').reject{|t| t.downcase == key}.insert(1, key).join(' ')
    end
    @description
  end

  def taxes
    @price * @rate * 0.01
  end

end
