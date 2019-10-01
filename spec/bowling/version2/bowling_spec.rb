require_relative '../../spec_helper'
require_relative '../../../kata/bowling/version2/bowling'
require_relative '../../../kata/bowling/version2/shots'

describe Version2::Bowling do

  it 'acceptance' do
    shots = Version2::Shots.new([1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6])
    bowling = described_class.new(shots)

    expect(bowling.score).to eq(133)
  end

  it 'all zero' do
    shots = Version2::Shots.new([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    bowling = described_class.new(shots)

    expect(bowling.score).to eq(0)
  end

  it 'all one' do
    shots = Version2::Shots.new([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1])
    bowling = described_class.new(shots)

    expect(bowling.score).to eq(20)
  end

  it 'all strike' do
    shots = Version2::Shots.new([10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10])
    bowling = described_class.new(shots)

    expect(bowling.score).to eq(300)
  end

end