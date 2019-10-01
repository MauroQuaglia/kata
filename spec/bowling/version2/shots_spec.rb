require_relative '../../spec_helper'
require_relative '../../../kata/bowling/version2/shots'

describe Version2::Shots do

  it 'first frame shots' do
    shots = described_class.new([1, 2])

    expect(shots.at_frames(0)).to eq([1, 2])
  end

  it 'second frame shots' do
    shots = described_class.new([1, 2, 3, 4])

    expect(shots.at_frames(1)).to eq([3, 4])
  end

  it 'second frame shots when strike in first frame' do
    shots = described_class.new([10, 3, 4])

    expect(shots.at_frames(0)).to eq([10, nil, 3, 4])
    expect(shots.at_frames(1)).to eq([3, 4])
  end

  it 'third frame shots when strike in first and second frame' do
    shots = described_class.new([10, 10, 1, 2])

    expect(shots.at_frames(0)).to eq([10, nil, 10, nil, 1])
    expect(shots.at_frames(1)).to eq([10, nil, 1, 2])
    expect(shots.at_frames(2)).to eq([1, 2])
  end

end