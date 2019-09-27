require 'test-unit'
require '../bowling'
require '../shots'

class AcceptanceTest < Test::Unit::TestCase

  def test_start_game
    bowling = Bowling.new Shots.new [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6]

    assert_equal 5, bowling.frame(1).score
    assert_equal 9, bowling.frame(2).score
    assert_equal 15, bowling.frame(3).score
    assert_equal 20, bowling.frame(4).score
    assert_equal 11, bowling.frame(5).score
    assert_equal 1, bowling.frame(6).score
    assert_equal 16, bowling.frame(7).score
    assert_equal 20, bowling.frame(8).score
    assert_equal 20, bowling.frame(9).score
    assert_equal 16, bowling.frame(10).score

    assert_equal 133, bowling.total_score
  end

end