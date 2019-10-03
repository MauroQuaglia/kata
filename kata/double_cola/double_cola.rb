class DoubleCola

  def who_is_next(names, n)
    map = Hash[(0...names.count).zip(names)]

    rest, power = 0, 0
    while (n - rest) > 0
      n = n - rest
      rest = (2 ** power) * names.count
      power += 1
    end

    part_size = rest / names.count
    index = ((n - (0.5)) / part_size).floor

    map[index]
  end

end