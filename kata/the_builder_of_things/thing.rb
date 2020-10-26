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

    if @collector.first == :is_a
      define_singleton_method("#{@collector[1]}?") {true}
    end

    if @collector.first == :is_not_a
      define_singleton_method("#{@collector[1]}?") {false}
    end

    if @collector.first == :is_the
      result = @collector[2].to_s
      define_singleton_method("#{@collector[1]}") {result}
    end

    if @collector[0] == :has
      result = Array([Thing.new(@collector[2])] * @collector[1])
      if @collector.size == 5
        result = Array([Thing.new(@collector[2]) {@collector[4]}] * @collector[1])
      end
      define_singleton_method("#{@collector[2]}") {result}
    end

    self
  end


end