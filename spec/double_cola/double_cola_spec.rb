require_relative '../spec_helper'
require_relative '../../kata/double_cola/double_cola'

describe DoubleCola do
  let(:double_cola) {DoubleCola.new}

  it 'test zip' do
    a = ['a', 'b']

    expect(Hash[(0...a.count).zip(a)]).to eq(0 => 'a', 1 => 'b')
  end

  it 'test who_is_next' do
    expect(double_cola.who_is_next(["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 75)).to eq('Howard')
  end

  it 'tests for 5' do
    expect(double_cola.who_is_next(['S', 'L', 'P', 'R', 'H'], 1)).to eq('S')
    expect(double_cola.who_is_next(['S', 'L', 'P', 'R', 'H'], 2)).to eq('L')
    expect(double_cola.who_is_next(['S', 'L', 'P', 'R', 'H'], 3)).to eq('P')
    expect(double_cola.who_is_next(['S', 'L', 'P', 'R', 'H'], 4)).to eq('R')
    expect(double_cola.who_is_next(['S', 'L', 'P', 'R', 'H'], 5)).to eq('H')
    expect(double_cola.who_is_next(['S', 'L', 'P', 'R', 'H'], 6)).to eq('S')
    expect(double_cola.who_is_next(['S', 'L', 'P', 'R', 'H'], 9)).to eq('L')
    expect(double_cola.who_is_next(['S', 'L', 'P', 'R', 'H'], 15)).to eq('H')
    expect(double_cola.who_is_next(['S', 'L', 'P', 'R', 'H'], 16)).to eq('S')
    expect(double_cola.who_is_next(['S', 'L', 'P', 'R', 'H'], 20)).to eq('L')
  end

  it 'tests for 4' do
    expect(double_cola.who_is_next(['S', 'H', 'L', 'M'], 1)).to eq('S')
    expect(double_cola.who_is_next(['S', 'H', 'L', 'M'], 2)).to eq('H')
    expect(double_cola.who_is_next(['S', 'H', 'L', 'M'], 3)).to eq('L')
    expect(double_cola.who_is_next(['S', 'H', 'L', 'M'], 4)).to eq('M')
    expect(double_cola.who_is_next(['S', 'H', 'L', 'M'], 5)).to eq('S')
    expect(double_cola.who_is_next(['S', 'H', 'L', 'M'], 9)).to eq('L')
    expect(double_cola.who_is_next(['S', 'H', 'L', 'M'], 12)).to eq('M')
    expect(double_cola.who_is_next(['S', 'H', 'L', 'M'], 13)).to eq('S')
  end

  it 'tests for 3' do
    expect(double_cola.who_is_next(['S', 'H', 'L'], 1)).to eq('S')
    expect(double_cola.who_is_next(['S', 'H', 'L'], 2)).to eq('H')
    expect(double_cola.who_is_next(['S', 'H', 'L'], 3)).to eq('L')
    expect(double_cola.who_is_next(['S', 'H', 'L'], 4)).to eq('S')
    expect(double_cola.who_is_next(['S', 'H', 'L'], 6)).to eq('H')
    expect(double_cola.who_is_next(['S', 'H', 'L'], 9)).to eq('L')
    expect(double_cola.who_is_next(['S', 'H', 'L'], 15)).to eq('H')
  end

  it 'tests for 2' do
    expect(double_cola.who_is_next(['S', 'H'], 1)).to eq('S')
    expect(double_cola.who_is_next(['S', 'H'], 2)).to eq('H')
    expect(double_cola.who_is_next(['S', 'H'], 3)).to eq('S')
    expect(double_cola.who_is_next(['S', 'H'], 6)).to eq('H')
    expect(double_cola.who_is_next(['S', 'H'], 10)).to eq('S')
  end

  it 'tests for 1' do
    expect(double_cola.who_is_next(['S'], 1)).to eq('S')
    expect(double_cola.who_is_next(['S'], 2)).to eq('S')
    expect(double_cola.who_is_next(['S'], 3)).to eq('S')
    expect(double_cola.who_is_next(['S'], 4)).to eq('S')
  end

  it 'acceptance' do
    expect(double_cola.who_is_next(["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 1)).to eq('Sheldon')
    expect(double_cola.who_is_next(["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 6)).to eq('Sheldon')
    expect(double_cola.who_is_next(["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 52)).to eq('Penny')
    expect(double_cola.who_is_next(["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 7230702951)).to eq('Leonard')
  end

end