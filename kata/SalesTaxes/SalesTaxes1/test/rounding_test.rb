require 'test-unit'
require_relative '../rounding'

class RoundingTest < Test::Unit::TestCase

  def test_rounding_up
    rounding = Rounding.new(0.05)

    assert_equal 0, rounding.up(0)
    assert_equal 0.05, rounding.up(0.025)
    assert_equal 0.05, rounding.up(0.050)
    assert_equal 0.10, rounding.up(0.075)
    assert_equal 0.10, rounding.up(0.100)
  end

end

