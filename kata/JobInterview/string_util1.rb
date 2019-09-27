class StringUtil1

  def normalizeSpaces1(s)
    r = ''
    for i in 0...s.length
      r+=s[i] if s[i]!=' ' || s[i+1]!=' '
    end
    r[0]='' if r[0]==' '
    r[-1]='' if r[-1]==' '
    r
  end

  def normalizeSpaces2(s)
    r=''
    b=' '+s+' '
    for i in 0...b.length
      r+=b[i] if b[i]!=' ' || r[-1]!=' '
    end
    r[0]=r[-1]=''
    r
  end

  def normalizeSpaces3(s)
    r=''; b = ' ' + s + ' '
    for i in 0...b.length
      r += b[i] if b[i] != ' ' || r[-1] != ' '
    end
    r[1...-1]
  end

  def normalizeSpaces4(s)
    s.gsub(/\s+/, ' ').strip
  end

end
