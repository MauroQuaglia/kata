module Version1

  class Frame
    def initialize(shots)
      @shots = shots.compact.push(0, 0)
    end

    def score
      strike? || spare? ? sum(@shots[0..2]) : sum(@shots[0..1])
    end

    private

    def strike?
      @shots.first == 10
    end

    def spare?
      sum(@shots[0..1]) == 10
    end

    def sum(shots)
      shots.inject {|s, x| s + x}
    end
  end

end