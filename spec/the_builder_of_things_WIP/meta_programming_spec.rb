require_relative '../spec_helper'

class Rich
  def initialize
    define_singleton_method(:man) {'yes'}
  end

  def method_missing(symbol, *args)
    puts 'In the Rich!'
    'In the Rich!'
  end
end

class Poor
  def method_missing(symbol, *args)
    puts 'In the Poor!'
    'In the Poor!'
  end
end

class Creso
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def each(&block)
    puts block.inspect
    block.call
  end

  def having(value)
    raise 'hjhj'
  end

  def method_missing(symbol, *args)
    define_singleton_method("#{symbol}?") {args.first}
  end
end

describe 'Metaprogramming' do

  it 'the rich class' do
    rich = Rich.new
    expect(rich.respond_to?(:man)).to be_truthy
    expect(rich.man).to eq('yes')
  end

  it 'the poor class' do
    poor = Poor.new
    expect(poor.respond_to?(:man)).to be_falsey
  end

  it 'method missing' do
    poor, rich = Poor.new, Rich.new
    expect(poor.cucu).to eq('In the Poor!')
    expect(rich.cucu).to eq('In the Rich!')
  end

  it 'creso man' do
    creso = Creso.new('Creso')
    creso.man(true)
    expect(creso.respond_to?(:man?)).to be_truthy
    expect(creso.man?).to be_truthy
  end

  it 'creso man redefined' do
    creso = Creso.new('Creso')

    creso.man(true)
    expect(creso.respond_to?(:man?)).to be_truthy
    expect(creso.man?).to be_truthy

    creso.man(false)
    expect(creso.respond_to?(:man?)).to be_truthy
    expect(creso.man?).to be_falsey
  end

  xit 'creso block' do
    #jane.has(2).arms.each { having(1).hand.having(5).fingers }
    Creso.new('Creso').each {having(1)}
  end

end
