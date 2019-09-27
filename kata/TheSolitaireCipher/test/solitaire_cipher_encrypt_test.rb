require 'test-unit'
require '../solitaire_cipher'

class SolitaireCipherEncryptTest < Test::Unit::TestCase

  def setup
    @value='Code in Ruby, live longer!'
  end

  def test_one_filter
    assert_solitare_chiper(
        [LetterFilter],
        @value, 'CodeinRubylivelonger')
  end

  def test_two_filters
    assert_solitare_chiper(
        [LetterFilter, UppercaseFilter],
        @value, 'CODEINRUBYLIVELONGER')
  end

  def test_three_filters
    assert_solitare_chiper(
        [LetterFilter, UppercaseFilter, SplitCharacterFilter],
        @value, 'CODEI NRUBY LIVEL ONGER')
  end

  def test_four_filters
    assert_solitare_chiper(
        [LetterFilter, UppercaseFilter, SplitCharacterFilter, LetterToNumberFilter],
        @value, [3, 15, 4, 5, 9, 14, 18, 21, 2, 25, 12, 9, 22, 5, 12, 15, 14, 7, 5, 18])
  end

  def test_letter_to_number_filters
    assert_solitare_chiper(
        [LetterFilter, UppercaseFilter, SplitCharacterFilter, LetterToNumberFilter],
        'DWJXH YRFDG TMSHP UURXJ', [4, 23, 10, 24, 8, 25, 18, 6, 4, 7, 20, 13, 19, 8, 16, 21, 21, 18, 24, 10])
  end

  def test_number_generator_filter
    assert_solitare_chiper(
        [LetterFilter, UppercaseFilter, SplitCharacterFilter, LetterToNumberFilter, NumberGeneratorFilter],
        @value, [7, 12, 14, 3, 17, 13, 10, 1, 6, 6, 6, 22, 15, 13, 2, 10, 9, 25, 3, 2])
  end

  def test_number_to_letter_filter
    assert_solitare_chiper(
        [LetterFilter, UppercaseFilter, SplitCharacterFilter, LetterToNumberFilter, NumberGeneratorFilter, NumberToLetterFilter],
        @value, 'GLNCQMJAFFFVOMBJIYCB')
  end

  private

  def assert_solitare_chiper(filters, value, result)
    assert_equal result, SolitaireCipher.new(filters).encrypt(value)
  end

end
