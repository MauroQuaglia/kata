require_relative '../spec_helper'
require_relative '../../kata/getting_along_with_integer_partitions/getting_along_with_integer_partitions'

describe GettingAlongWithIntegerPartitions do
  let(:partitions) {GettingAlongWithIntegerPartitions.new}

  it 'test 0' do
    a = [1, 2, 3]
    b = [4, 5, 6]

    expect(a.concat(b)).to eq([1, 2, 3, 4, 5, 6])
    expect(a).to eq([1, 2, 3, 4, 5, 6])
    expect(b).to eq([4, 5, 6])
  end

  it 'test 1' do
    a = [1, 2, 3]
    b = [4, 5, 6]

    expect(a + b).to eq([1, 2, 3, 4, 5, 6])
    expect(a).to eq([1, 2, 3])
    expect(b).to eq([4, 5, 6])
  end

  it 'test 2' do
    a = [1, 2, 3]
    b = [4, 5, 6]
    c = a.clone

    expect(a.concat(b)).to eq([1, 2, 3, 4, 5, 6])
    expect(a).to eq([1, 2, 3, 4, 5, 6])
    expect(b).to eq([4, 5, 6])
    expect(c).to eq([1, 2, 3])
  end

  context 'acceptance' do

    it 'should be pass' do
      expect(partitions.part(1)).to eq("Range: 0 Average: 1.00 Median: 1.00")
      expect(partitions.part(2)).to eq("Range: 1 Average: 1.50 Median: 1.50")
      expect(partitions.part(3)).to eq("Range: 2 Average: 2.00 Median: 2.00")
      expect(partitions.part(4)).to eq("Range: 3 Average: 2.50 Median: 2.50")
      expect(partitions.part(5)).to eq("Range: 5 Average: 3.50 Median: 3.50")
    end

  end

  describe '#sum' do

    it '1 + p(1)' do
      expect(partitions.sum(1, [[1]])).to eq([[1, 1]])
    end

    it '2 + p(1)' do
      expect(partitions.sum(2, [[1]])).to eq([[2, 1]])
    end

    it '3 + p(1)' do
      expect(partitions.sum(3, [[1]])).to eq([[3, 1]])
    end

    it '2 + p(2)' do
      expect(partitions.sum(2, [[2], [1, 1]])).to eq([[2, 2], [2, 1, 1]])
    end

    it '3 + p(2)' do
      expect(partitions.sum(3, [[2], [1, 1]])).to eq([[3, 2], [3, 1, 1]])
    end

    it '2 + p(3)' do
      expect(partitions.sum(2, [[3], [2, 1], [1, 1, 1]])).to eq([[2, 2, 1], [2, 1, 1, 1,]])
    end

    it '2 + p(4)' do
      expect(partitions.sum(2, [[4], [3, 1], [2, 2], [2, 1, 1], [1, 1, 1, 1]])).to eq([[2, 2, 2], [2, 2, 1, 1], [2, 1, 1, 1, 1]])
    end

  end

  describe 'enums' do

    it 'should retrieve partitions 1' do
      expect(partitions.enum(1)).to eq([[1]])
      expect(partitions.enum(2)).to eq([[2], [1, 1]])
      expect(partitions.enum(3)).to eq([[3], [2, 1], [1, 1, 1]])
      expect(partitions.enum(4)).to eq([[4], [3, 1], [2, 2], [2, 1, 1], [1, 1, 1, 1]])
      expect(partitions.enum(5)).to eq([[5], [4, 1], [3, 2], [3, 1, 1], [2, 2, 1], [2, 1, 1, 1], [1, 1, 1, 1, 1]])
      expect(partitions.enum(6)).to eq([[6], [5, 1], [4, 2], [4, 1, 1], [3, 3], [3, 2, 1], [3, 1, 1, 1], [2, 2, 2], [2, 2, 1, 1], [2, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1]])
    end

    it 'should retrieve partitions 2' do
      expect(partitions.enum2(1)).to eq([[1]])
      expect(partitions.enum2(2)).to eq([[2], [1, 1]])
      expect(partitions.enum2(3)).to eq([[3], [2, 1], [1, 1, 1]])
      expect(partitions.enum2(4)).to eq([[4], [3, 1], [2, 2], [2, 1, 1], [1, 1, 1, 1]])
      expect(partitions.enum2(5)).to eq([[5], [4, 1], [3, 2], [3, 1, 1], [2, 2, 1], [2, 1, 1, 1], [1, 1, 1, 1, 1]])
      expect(partitions.enum2(6)).to eq([[6], [5, 1], [4, 2], [4, 1, 1], [3, 3], [3, 2, 1], [3, 1, 1, 1], [2, 2, 2], [2, 2, 1, 1], [2, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1]])
    end

  end

  describe '#prod' do

    it 'should retrieve the product' do
      expect(partitions.prod(1)).to eq([1])
      expect(partitions.prod(2)).to eq([1, 2])
      expect(partitions.prod(3)).to eq([1, 2, 3])
      expect(partitions.prod(4)).to eq([1, 2, 3, 4])
      expect(partitions.prod(5)).to eq([1, 2, 3, 4, 5, 6])
      expect(partitions.prod(6)).to eq([1, 2, 3, 4, 5, 6, 8, 9])
    end

  end

  describe '#range' do

    it 'should retrieve the range' do
      expect(partitions.range([1])).to eq(0)
      expect(partitions.range([1, 2])).to eq(1)
      expect(partitions.range([1, 2, 3])).to eq(2)
      expect(partitions.range([1, 2, 3, 4])).to eq(3)
      expect(partitions.range([1, 2, 3, 4, 5, 6])).to eq(5)
      expect(partitions.range([1, 2, 3, 4, 5, 6, 8, 9])).to eq(8)
    end

  end

  describe '#average' do

    it 'should retrieve the average' do
      expect(partitions.average([1])).to eq('1.00')
      expect(partitions.average([1, 2])).to eq('1.50')
      expect(partitions.average([1, 2, 3])).to eq('2.00')
      expect(partitions.average([1, 2, 3, 4])).to eq('2.50')
      expect(partitions.average([1, 2, 3, 4, 5, 6])).to eq('3.50')
      expect(partitions.average([1, 2, 3, 4, 5, 6, 8, 9])).to eq('4.75')
    end

  end

  describe '#median' do

    it 'should retrieve the median' do
      expect(partitions.median([1])).to eq('1.00')
      expect(partitions.median([1, 2])).to eq('1.50')
      expect(partitions.median([1, 2, 3])).to eq('2.00')
      expect(partitions.median([1, 2, 3, 4])).to eq('2.50')
      expect(partitions.median([1, 2, 3, 4, 5, 6])).to eq('3.50')
      expect(partitions.median([1, 2, 3, 4, 5, 6, 8, 9])).to eq('4.50')
    end

  end

end
