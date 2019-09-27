require 'test-unit'
require '../decimal1'

class DecimalTest < Test::Unit::TestCase

  def test_one
    assert_equal 'I', Decimal1.new.to_roman(1)
  end

  def test_two
    assert_equal 'II', Decimal1.new.to_roman(2)
  end

  def test_three
    assert_equal 'III', Decimal1.new.to_roman(3)
  end

  def test_four
    assert_equal 'IV', Decimal1.new.to_roman(4)
  end

  def test_five
    assert_equal 'V', Decimal1.new.to_roman(5)
  end

  def test_six
    assert_equal 'VI', Decimal1.new.to_roman(6)
  end

end
