require_relative '../../spec_helper'
require_relative '../../../kata/bowling/version_2/bowling2'
require_relative '../../../kata/bowling/version_2/shots2'

describe Bowling2 do

  it 'acceptance' do
    shots = Shots2.new([1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6])
    bowling = Bowling2.new(shots)

    expect(bowling.score).to eq(133)
  end

  it 'all zero' do
    shots = Shots2.new([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    bowling = Bowling2.new(shots)

    expect(bowling.score).to eq(0)
  end

  it 'all one' do
    shots = Shots2.new([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1])
    bowling = Bowling2.new(shots)

    expect(bowling.score).to eq(20)
  end

  it 'all strike' do
    shots = Shots2.new([10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10])
    bowling = Bowling2.new(shots)

    expect(bowling.score).to eq(300)
  end

end