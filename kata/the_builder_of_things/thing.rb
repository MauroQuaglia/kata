class Thing
  attr_reader(:name)

  def initialize(name)
    @name = name
  end

  def method_missing(symbol, *args)
    puts "symbol: [#{symbol}] - args: [#{args}]"
    if
    (symbol == 'is_a')
      define_method("#{args.to_s}?", true)
    end
    self
  end

end