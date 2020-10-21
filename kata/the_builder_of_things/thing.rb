class Thing
  attr_reader(:name)

  def initialize(name)
    @name = name
    @collector = []
  end

  def method_missing(symbol, *args)
    @collector << symbol
    #puts "symbol: [#{symbol}] - args: [#{args}]"
    puts "collector: #{@collector}"

    if @collector[0] == :is_a && @collector.size == 2
      define_singleton_method("#{@collector[1]}?") {true}
      @collector.clear
    end

    if @collector[0] == :is_not_a && @collector.size == 2
      define_singleton_method("#{@collector[1]}?") {false}
      @collector.clear
    end

    if @collector[0] == :is_the && @collector.size == 3
      result = @collector[2].to_s
      define_singleton_method("#{@collector[1]}") {result}
      @collector.clear
    end

    self
  end


end