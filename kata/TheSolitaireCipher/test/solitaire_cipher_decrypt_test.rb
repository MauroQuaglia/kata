require 'test-unit'
require '../solitaire_cipher'

class SolitaireCipherEncryptTest < Test::Unit::TestCase

  def test_one_filter
    assert_solitare_chiper(
        [LetterFilter],
        @value, 'CodeinRubylivelonger')
  end


end
