class Checkout

  def initialize(rounding, receipt)
    @rounding = rounding
    @receipt = receipt
    @total = 0
    @taxes = 0
  end

  def scan(product)
    @taxes += round_taxes(product)
    @total += total_price(product)

    @receipt.add(product.description, total_price(product))
  end

  def receipt
    @receipt.add_taxes @taxes
    @receipt.add_total @total
    @receipt.print
  end

  private

  def total_price(product)
    product.price + round_taxes(product)
  end

  def round_taxes(product)
    @rounding.up(product.taxes)
  end

end
