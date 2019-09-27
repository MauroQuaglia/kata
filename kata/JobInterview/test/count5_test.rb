require 'test-unit'
require_relative '../array_util'

class Count5Test < Test::Unit::TestCase

  def test_empty_array
    assert_count5(0, [])
  end

  def test_one_element_less_than_5
    assert_count5(0, [2])
  end

  def test_one_element_greather_than_5
    assert_count5(1, [6])
  end

  def test_acceptance
    assert_count5(1, [2, 9, 2, 3, 5])
    assert_count5(3, [6, 7, 8])
    assert_count5(0, [1,3,5])
  end

  private

  def assert_count5(expected, original)
    assert_equal(expected, ArrayUtil.new.count51(original))
    assert_equal(expected, ArrayUtil.new.count52(original))
  end

end