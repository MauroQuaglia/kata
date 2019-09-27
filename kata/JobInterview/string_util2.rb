class StringUtil2

  def reverse1(s)
    r=''
    i = s.length-1
    while (i >= 0)
      r += s[i]
      i-=1
    end
    r
  end

  def reverse2(s)
    r=''
    for i in (0...s.length)
      r+=s[s.length-1-i]
    end
    r
  end

  def reverse3(s)
    r = s.chars
    for i in 0...r.length/2
      r.insert(i, r[r.length-1-i])
      r.delete_at(r.length-1-i)
      r.insert(r.length-i, r[i+1])
      r.delete_at(i+1)
    end
    r.join
  end

  def reverse4(s)
    for i in 0...s.length/2
      a=s[i]
      s[i]=s[s.length-1-i]
      s[s.length-1-i] = a
    end
    s
  end

  def reverse5(s)
    s.reverse!
  end

end
