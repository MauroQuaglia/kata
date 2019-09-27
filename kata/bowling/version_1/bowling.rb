require_relative '../../../kata/bowling/version_1/frame'

class Bowling

  def initialize(shots)
    @shots = shots
  end

  def frame(number)
    Frame.new(@shots.at_frames(number))
  end

  def total_score
    score = 0
    @shots.frames_numbers.times do |n|
      score += frame(n + 1).score if n != 10
    end
    score
  end

end