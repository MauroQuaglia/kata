require 'test-unit'
require '../frame'

class FrameTest < Test::Unit::TestCase

  def test_ordinary
    assert_frame_score([6, 2], 8)
  end

  def test_spare
    assert_frame_score([4, 6, 2], 12)
  end

  def test_strike
    assert_frame_score([10, 6, 2], 18)
  end

  private

  def assert_frame_score(shots, score)
    assert_equal score, Frame.new(shots).score
  end

end
