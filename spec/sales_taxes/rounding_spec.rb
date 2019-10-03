require 'test-unit'
require_relative '../../../kata/sales_taxes/nding'

class RoundingTest < Test::Unit::TestCase

  def test_rounding_up
    rounding = Rounding.new(0.05)

    assert_equal 0, rounding.up(0)
    assert_equal 0.05, rounding.up(0.025)
    assert_equal 0.05, rounding.up(0.050)
    assert_equal 0.10, rounding.up(0.075)
    assert_equal 0.10, rounding.up(0.100)
  end

  def test_no_rounding
    rounding = Rounding.new(0)

    assert_equal 0, rounding.up(0)
    assert_equal 0.50, rounding.up(0.50)
    assert_equal 1.00, rounding.up(1.00)
  end

end

