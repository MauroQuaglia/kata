class Thing
  attr_reader(:name)

  def initialize(name)
    @name = name
    @collector = []
    #Quindi qui gli arriva il blocco del tipo having(1).hand.having(5).fingers
    # e deve creare al volo il metodo hand e finger (cioè deve chiamare un altro define_singleton_method(:hand) {[Thing.new('head')]})
  end

  #jane.has(2).arms.each { having(1).hand.having(5).fingers }
  #jane.arms.first ---> Thing('arms')
  #jane.arms.first.hand.fingers.size
  def method_missing(symbol, *args, &block)
    @collector << symbol
    @collector << args.first if args.any?
    @collector << block if block_given?
    #puts "collector: #{@collector}"

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

    if @collector[0] == :has && @collector.size == 3
      # Devo passare il blocco qua in inizializzazione
      result = Array([Thing.new(@collector[2])] * @collector[1])
      define_singleton_method("#{@collector[2]}") {result}
      @collector.clear
    end

    self
  end


end