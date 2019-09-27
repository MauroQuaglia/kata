require 'test-unit'
require '../bowling'
require '../shots'

class AcceptanceTest < Test::Unit::TestCase

  def test_acceptance
    assert_bowling_score([1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6], 133)
  end

  def test_all_zero
    assert_bowling_score([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 0)
  end

  def test_all_one
    assert_bowling_score([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], 20)
  end

  def test_all_strike
    assert_bowling_score([10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10], 300)
  end

  private

  def assert_bowling_score(shots, score)
    bowling = Bowling.new(Shots.new(shots))
    assert_equal score, bowling.score
  end

end