require_relative '../../../kata/bowling/version_2/frame2'

class Bowling2

  def initialize(shots)
    @shots = shots
    @score = 0
  end

  def score
    10.times {|n| @score += frame(n).score}
    @score
  end

  private

  def frame(n)
    Frame2.new(@shots.at_frames(n))
  end

end