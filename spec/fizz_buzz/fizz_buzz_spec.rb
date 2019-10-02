require_relative '../spec_helper'
require_relative '../../kata/fizz_buzz/fizz_buzz'

describe FizzBuzz do

  it 'return 1 for 1' do
    expect(described_class.new.for(1)).to eq(1)
  end

  it 'return fizz for 3' do
    expect(described_class.new.for(3)).to eq('Fizz')
  end

  it 'return buzz for 5' do
    expect(described_class.new.for(5)).to eq('Buzz')
  end

  it 'return fizzbuzz for 15' do
    expect(described_class.new.for(15)).to eq('FizzBuzz')
  end

  it 'acceptance' do
    expect(described_class.new.for(2)).to eq(2)
    expect(described_class.new.for(6)).to eq('Fizz')
    expect(described_class.new.for(10)).to eq('Buzz')
    expect(described_class.new.for(30)).to eq('FizzBuzz')
  end

end