require_relative '../spec_helper'
require_relative '../../kata/job_interview/normalize_spaces'

describe NormalizeSpaces do

  it 'normalize empty string' do
    assert_normalized('', '')
  end

  it 'normalize one character string' do
    assert_normalized('', ' ')
    assert_normalized('a', 'a')
  end

  it 'normalize two characters string' do
    assert_normalized('', '  ')
    assert_normalized('a', ' a')
    assert_normalized('a', 'a ')
    assert_normalized('aa', 'aa')
  end

  it 'normalize three characters string' do
    assert_normalized('', '   ')
    assert_normalized('a', '  a')
    assert_normalized('a', ' a ')
    assert_normalized('aa', ' aa')
    assert_normalized('a', 'a  ')
    assert_normalized('a a', 'a a')
    assert_normalized('aa', 'aa ')
    assert_normalized('aaa', 'aaa')
  end

  it 'normalize four characters string' do
    assert_normalized('a a', 'a  a')
  end

  it 'acceptance' do
    assert_normalized('ciao mirko', 'ciao       mirko')
    assert_normalized('oggi fa freddo', 'oggi fa  freddo')
    assert_normalized('ciao', 'ciao')
  end

  private

  def assert_normalized(expected, original)
    expect(described_class.new.normalize_spaces_1(original.dup)).to eq(expected)
    expect(described_class.new.normalize_spaces_2(original.dup)).to eq(expected)
    expect(described_class.new.normalize_spaces_3(original.dup)).to eq(expected)
    expect(described_class.new.normalize_spaces_4(original.dup)).to eq(expected)
  end

end
