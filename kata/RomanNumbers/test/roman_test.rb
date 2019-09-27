require 'test-unit'
require '../roman'

class RomanTest < Test::Unit::TestCase

  def test_unit
    assert_equal 1, Roman.new.to_decimal('I')
    assert_equal 2, Roman.new.to_decimal('II')
    assert_equal 3, Roman.new.to_decimal('III')
    assert_equal 4, Roman.new.to_decimal('IV')
    assert_equal 5, Roman.new.to_decimal('V')
    assert_equal 6, Roman.new.to_decimal('VI')
    assert_equal 7, Roman.new.to_decimal('VII')
    assert_equal 8, Roman.new.to_decimal('VIII')
    assert_equal 9, Roman.new.to_decimal('IX')
  end

end