require '../filters'

class SolitaireCipher

  def initialize(filters)
    @filters = filters
  end

  def encrypt(value)
    value.downcase!
    @filters.each{|filter| value=filter.new.do(value)}
    value.upcase!
  end
end