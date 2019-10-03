module TimeSupport

  def minutes(value)
    Rational(value * 60, 86400)
  end

  def hours(value)
    minutes(value * 60)
  end

  def days(value)
    hours(value * 24)
  end

  def years(value)
    days(value * 365)
  end

end