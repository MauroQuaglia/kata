require_relative '../../kata/sales_taxes/cash'

class Supermarket

  def initialize(rounding, receipt, product_factory)
    @checkout = Cash.new rounding, receipt
    @product_factory = product_factory
  end

  def checkout(shopper)
    shopper.goods.each {|good| @checkout.scan @product_factory.create good}
  end

  def receipt
    @checkout.receipt
  end

end