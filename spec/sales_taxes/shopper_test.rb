require 'test-unit'
require_relative '../../../kata/sales_taxes/pper'

class ShopperTest < Test::Unit::TestCase

  def test_one_good
    shopping_list='a'

    shopper=Shopper.new(shopping_list)

    assert_equal 1, shopper.goods.length
    assert_equal 'a', shopper.goods[0]
  end

  def test_two_goods
    shopping_list="a\nb"

    shopper=Shopper.new(shopping_list)

    assert_equal 2, shopper.goods.length
    assert_equal 'a', shopper.goods[0]
    assert_equal 'b', shopper.goods[1]
  end

end
