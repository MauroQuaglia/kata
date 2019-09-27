class Rounding

  def initialize(sensibility = 0)
    @sensibility = sensibility
  end

  def up(value)
    @sensibility.zero? ? value : ((value / @sensibility).ceil) * @sensibility
  end

end