require_relative '../spec_helper'
require_relative '../../kata/find_the_stray_number/find_the_stray_number'

describe FindTheStrayNumber do

  it 'acceptance' do
    expect(described_class.new.stray([1, 1, 2])).to eq(2)
    expect(described_class.new.stray([17, 17, 3, 17, 17, 17, 17])).to eq(3)
  end

  it 'test 1' do
    expect(described_class.new.stray([1, 1, 2, 2, 3])).to eq(3)
  end
  
end