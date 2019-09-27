class Rounding

  def initialize(sensibility = 0.05)
    @sensibility = sensibility
  end

  def up(x)
    ((x / @sensibility).ceil) * @sensibility
  end

end