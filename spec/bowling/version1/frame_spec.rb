require_relative '../../spec_helper'
require_relative '../../../kata/bowling/version1/frame'

describe Version1::Frame do

  it 'should be a ordinary' do
    expect(described_class.new([6, 2]).score).to eq(8)
  end

  it 'should be a spare' do
    expect(described_class.new([4, 6, 2]).score).to eq(12)
  end

  it 'should be a strike' do
    expect(described_class.new([10, 6, 2]).score).to eq(18)
  end

end
