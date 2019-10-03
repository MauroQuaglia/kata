require_relative '../spec_helper'
require_relative '../../kata/simple_encryption/alternating_split'

describe AlternatingSplit do
  let(:alternating_split) {AlternatingSplit.new}

  it 'test 0' do
    array = ['0', '2', '4', '1', '3', '5']
    a = array[0..(array.size / 2) - 1]
    b = array[(array.size / 2)..-1]

    result = ''
    ((array.size / 2)).times do |n|
      result << a[n] + b[n]
    end

    expect(result).to eq('012345')
  end

  it 'test 1' do
    array = ['0', '2', '4', '1', '3', '5']

    a = array.size / 2

    result = ''
    a.times do |n|
      result += (array[n] + array[n + a])
    end
    result += array[a + 1] if array.size.odd?

    expect(result).to eq('012345')
  end

  it 'test 2' do
    value = '13024'
    array = value.chars

    result = ''
    array.size.times do |n|
      tmp = n.odd? ? array[n / 2] : array[(n + array.size) / 2]
      result += tmp
    end

    expect(result).to eq('01234')
  end

  describe '#encrypt' do

    it 'test 1' do
      expect(alternating_split.encrypt('a', 1)).to eq('a')
      expect(alternating_split.encrypt('ab', 1)).to eq('ba')
      expect(alternating_split.encrypt('abc', 1)).to eq('bac')
      expect(alternating_split.encrypt('abcd', 1)).to eq('bdac')
      expect(alternating_split.encrypt('abcde', 1)).to eq('bdace')
    end

    it 'simple test on text' do
      expect(alternating_split.encrypt(nil, 0)).to be_nil
      expect(alternating_split.encrypt(nil, 1)).to be_nil
      expect(alternating_split.encrypt('', 0)).to be_empty
      expect(alternating_split.encrypt('', 1)).to be_empty
    end

    it 'simple test on n' do
      expect(alternating_split.encrypt('This is a test!', -1)).to eq('This is a test!')
      expect(alternating_split.encrypt('This is a test!', 0)).to eq('This is a test!')
    end

    it 'codewars' do
      expect(alternating_split.encrypt('This is a test!', 1)).to eq('hsi  etTi sats!')
      expect(alternating_split.encrypt('This is a test!', 2)).to eq('s eT ashi tist!')
      expect(alternating_split.encrypt('This is a test!', 3)).to eq(' Tah itse sits!')
      expect(alternating_split.encrypt('This is a test!', 4)).to eq('This is a test!')
      expect(alternating_split.encrypt('This kata is very interesting!', 1)).to eq('hskt svr neetn!Ti aai eyitrsig')
    end

  end

  describe '#decrypt' do

    it 'test 1' do
      expect(alternating_split.decrypt('a', 1)).to eq('a')
      expect(alternating_split.decrypt('ba', 1)).to eq('ab')
      expect(alternating_split.decrypt('bac', 1)).to eq('abc')
      expect(alternating_split.decrypt('bdac', 1)).to eq('abcd')
      expect(alternating_split.decrypt('bdace', 1)).to eq('abcde')
    end

    it 'simple test on text' do
      expect(alternating_split.decrypt(nil, 0)).to be_nil
      expect(alternating_split.decrypt(nil, 1)).to be_nil
      expect(alternating_split.decrypt('', 0)).to be_empty
      expect(alternating_split.decrypt('', 1)).to be_empty
    end

    it 'codewars' do
      expect(alternating_split.decrypt('This is a test!', 0)).to eq('This is a test!')
      expect(alternating_split.decrypt('hsi  etTi sats!', 1)).to eq('This is a test!')
      expect(alternating_split.decrypt('s eT ashi tist!', 2)).to eq('This is a test!')
      expect(alternating_split.decrypt(' Tah itse sits!', 3)).to eq('This is a test!')
      expect(alternating_split.decrypt('This is a test!', 4)).to eq('This is a test!')
      expect(alternating_split.decrypt('This is a test!', -1)).to eq('This is a test!')
      expect(alternating_split.decrypt('hskt svr neetn!Ti aai eyitrsig', 1)).to eq('This kata is very interesting!')
    end

  end


end