class Thing
  attr_reader(:name)
  KEYS = [:is_a, :is_not_a, :is_the, :has]

  def initialize(name, &block)
    @name = name
    @block = block
    @collector = []
  end

  #jane.has(2).arms.each { having(1).hand.having(5).fingers }
  #jane.arms.first ---> Thing('arms')
  #jane.arms.first.hand.fingers.size
  def method_missing(symbol, *args, &block)
    @collector.clear if KEYS.include?(symbol)
    @collector << symbol
    @collector << args.first if args.any?
    @collector << block if block_given?
    #puts "collector: #{@collector}"

    if key == :is_a
      method_name = @collector[1]
      define_singleton_method("#{method_name}?") {true}
    end

    if key == :is_not_a
      method_name = @collector[1]
      define_singleton_method("#{method_name}?") {false}
    end

    if key == :is_the
      method_name, method_arg = @collector[1], @collector[2].to_s
      define_singleton_method("#{method_name}") {method_arg}
    end

    if key == :has
      method_name, count = @collector[2], @collector[1]
      if @collector.size == 3
        result = Array([Thing.new(method_name)] * count)
      end
      if @collector.size == 5
        method_block = @collector[4]
        result = Array([Thing.new(method_name) {method_block}] * count)
      end
      define_singleton_method("#{method_name}") {result}
    end

    self
  end

  def key
    @collector[0]
  end

end