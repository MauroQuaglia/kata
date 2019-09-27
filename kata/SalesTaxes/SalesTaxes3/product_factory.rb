require '../product'

class ProductFactory

  def initialize
    @rate=Hash.new(0)
    @rate['perfume']=10
    @rate['music']=10
    @rate['imported']=5
  end

  def create(good)
    values=good.split(' at ')
    Product.new(values[0], values[1].to_f, taxes(values[0]))
  end

  private

  def taxes(description)
    description.split(' ').inject(0) { |sum, x| sum+@rate[x] }
  end

end
