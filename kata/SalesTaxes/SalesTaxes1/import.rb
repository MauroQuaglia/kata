class Import

  def initialize(product)
    @product = product
    @rate = 5
  end

  def description
    key='imported '
    @product.description.slice!(key)
    key + @product.description
  end

  def price
    @product.price
  end

  def taxes
    @product.taxes + duty
  end

  private

  def duty
    @product.price * @rate * 0.01
  end

end