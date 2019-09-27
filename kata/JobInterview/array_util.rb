class ArrayUtil

  def sum_odd_elements1(a)
    r=0
    for i in 1..a.length/2
      r+=a[2*i-1]
    end
    r
  end

  def sum_odd_elements2(a)
    r=0
    a.each { |x| r+=x if a.index(x)%2 == 1 }
    r
  end

  def count51(a)
    r=0
    for i in 0...a.length
      r+=1 if a[i] > 5
    end
    r
  end

  def count52(a)
    a.count { |x| x>5 }
  end

end
