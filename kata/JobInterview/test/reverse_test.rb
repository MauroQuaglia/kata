require 'test-unit'
require_relative '../string_util2'

class ReverseTest < Test::Unit::TestCase

  def test_reverse_empty_string
    assert_reverse('', '')
  end

  def test_reverse_one_character_string
    assert_reverse('a', 'a')
  end

  def test_reverse_two_characters_string
    assert_reverse('5h', 'h5')
  end

  def test_reverse_three_characters_string
    assert_reverse('1;a', 'a;1')
  end

  def test_acceptance
    assert_reverse('oaic', 'ciao')
    assert_reverse('okrim oaic', 'ciao mirko')
    assert_reverse('odderf af iggo', 'oggi fa freddo')
  end

  private

  def assert_reverse(expected, original)
    assert_equal(expected.dup, StringUtil2.new.reverse1(original.dup))
    assert_equal(expected.dup, StringUtil2.new.reverse2(original.dup))
    assert_equal(expected.dup, StringUtil2.new.reverse3(original.dup))
    assert_equal(expected.dup, StringUtil2.new.reverse4(original.dup))
    assert_equal(expected.dup, StringUtil2.new.reverse5(original.dup))
  end

end
