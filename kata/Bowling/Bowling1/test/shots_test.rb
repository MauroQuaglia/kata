require 'test-unit'
require '../shots'

class ShotsTest < Test::Unit::TestCase

  def test_first_frame_shots
    shots = Shots.new [1, 2]

    assert_equal [1, 2], shots.at_frames(1)
  end

  def test_second_frame_shots
    shots = Shots.new [1, 2, 3, 4]

    assert_equal [3, 4], shots.at_frames(2)
  end

  def test_second_frame_shots_when_strike_in_first_frame
    shots = Shots.new [10, 3, 4]

    assert_equal [10, nil, 3, 4], shots.at_frames(1)
    assert_equal [3, 4], shots.at_frames(2)
  end

  def test_third_frame_shots_when_strike_in_first_and_second_frame
    shots = Shots.new [10, 10, 1, 2]

    assert_equal [10, nil, 10, nil, 1], shots.at_frames(1)
    assert_equal [10, nil, 1, 2], shots.at_frames(2)
    assert_equal [1, 2], shots.at_frames(3)
  end

end