require_relative '../../spec_helper'
require_relative '../../../kata/bowling/version1/bowling'
require_relative '../../../kata/bowling/version1/shots'

describe Version1::Bowling do

  it 'should execute acceptance test' do
    bowling = described_class.new(
        Version1::Shots.new([1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6])
    )

    expect(bowling.frame(1).score).to eq(5)
    expect(bowling.frame(2).score).to eq(9)
    expect(bowling.frame(3).score).to eq(15)
    expect(bowling.frame(4).score).to eq(20)
    expect(bowling.frame(5).score).to eq(11)
    expect(bowling.frame(6).score).to eq(1)
    expect(bowling.frame(7).score).to eq(16)
    expect(bowling.frame(8).score).to eq(20)
    expect(bowling.frame(9).score).to eq(20)
    expect(bowling.frame(10).score).to eq(16)

    expect(bowling.total_score).to eq(133)
  end

end