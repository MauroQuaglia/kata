class NormalizeSpaces

  def normalize_spaces_1(s)
    r = ''
    for i in 0...s.length
      r += s[i] if s[i] != ' ' || s[i + 1] != ' '
    end
    r[0] = '' if r[0] == ' '
    r[-1] = '' if r[-1] == ' '
    r
  end

  def normalize_spaces_2(s)
    r = ''
    b = ' ' + s + ' '
    for i in 0...b.length
      r += b[i] if b[i] != ' ' || r[-1] != ' '
    end
    r[0] = r[-1] = ''
    r
  end

  def normalize_spaces_3(s)
    r = ''; b = ' ' + s + ' '
    for i in 0...b.length
      r += b[i] if b[i] != ' ' || r[-1] != ' '
    end
    r[1...-1]
  end

  def normalize_spaces_4(s)
    s.gsub(/\s+/, ' ').strip
  end

end
