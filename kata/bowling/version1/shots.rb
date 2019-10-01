module Version1

  class Shots
    def initialize(points_array)
      @shots = points_array.each_with_index {|points, shot| points_array.insert(shot.succ, nil) if strike?(shot, points)}
    end

    def at_frames(number)
      i = number - 1
      @shots[i * 2..(i * 2) + 4]
    end

    def frames_numbers
      @shots.length.divmod(2)[0] + @shots.length.divmod(2)[1]
    end

    private

    def strike?(shot, points)
      shot.even? && points == 10
    end
  end

end