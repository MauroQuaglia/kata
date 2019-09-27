class Shots

  def initialize(points_array)
    @shots = points_array.each_with_index {|points, shot| points_array.insert(shot.succ, nil) if strike?(shot, points)}
  end

  def at_frames(n)
    @shots[2 * n..2 * n + 4]
  end

  private

  def strike?(shot, points)
    shot.even? && points == 10
  end

end