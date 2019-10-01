require_relative '../../../kata/bowling/version2/frame'

module Version2

  class Bowling
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
      Version2::Frame.new(@shots.at_frames(n))
    end
  end

end