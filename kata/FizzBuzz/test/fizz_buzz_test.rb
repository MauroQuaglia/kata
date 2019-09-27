require 'test-unit'
require_relative '../fizz_buzz'

class FizzBuzzTest < Test::Unit::TestCase

  def setup
    @fizz_buzz = FizzBuzz.new
  end

  def test_return_1_for_1
    assert_result(1, 1)
  end

  def test_return_fizz_for_3
    assert_result('Fizz', 3)
  end

  def test_return_buzz_for_5
    assert_result('Buzz', 5)
  end

  def test_return_fizzbuzz_for_15
    assert_result('FizzBuzz', 15)
  end

  def test_miscellany
  assert_result(2, 2)
  assert_result('Fizz', 6)
  assert_result('Buzz', 10)
  assert_result('FizzBuzz', 30)
  end

  def assert_result(expected, actual)
    assert_equal(expected, @fizz_buzz.for(actual))
  end

end