require 'test-unit'
require_relative '../array_util'

class SumOddElementsTest < Test::Unit::TestCase

  def test_empty_array
    assert_sum_odd_elements(0, [])
  end

  def test_one_element_array
    assert_sum_odd_elements(0, [5])
  end

  def test_two_elements_array
    assert_sum_odd_elements(2, [5, 2])
  end

  def test_three_elements_array
    assert_sum_odd_elements(2, [5, 2, 4])
  end

  def test_acceptance
    assert_sum_odd_elements(9, [1, 2, 3, 7])
  end

  private

  def assert_sum_odd_elements(expected, original)
    assert_equal(expected, ArrayUtil.new.sum_odd_elements1(original))
    assert_equal(expected, ArrayUtil.new.sum_odd_elements2(original))
  end

end