require 'test-unit'
require '../solitaire_cipher'

class AcceptanceTest < Test::Unit::TestCase

  def setup
    @solitaire_cipher=SolitaireCipher.new(
        [LetterFilter, NormalizeFilter, LetterToNumber, NumberGeneratorFilter, NumberToLetter, SplitFilter])

  end

  def test_encrypt
    assert_equal 'GLNCQ MJAFF FVOMB JIYCB', @solitaire_cipher.encrypt('Code in Ruby, live longer!')
  end

  def test_decrypt
    assert_equal 'CODEI NRUBY LIVEL ONGER', @solitaire_cipher.decrypt('GLNCQ MJAFF FVOMB JIYCB')
  end

end
