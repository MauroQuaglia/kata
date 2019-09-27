require_relative 'product'

class Book < Product
  def initialize(description, price)
    super(description, price, 0)
  end
end

class Food < Product
  def initialize(description, price)
    super(description, price, 0)
  end
end

class Music < Product
  def initialize(description, price)
    super(description, price, 10)
  end
end

class Cosmetic < Product
  def initialize(description, price)
    super(description, price, 10)
  end
end
