require_relative '../spec_helper'
require_relative '../../kata/job_interview/reverse'

describe Reverse do

  it 'reverse empty string' do
    assert_reverse('', '')
  end

  it 'reverse one character string' do
    assert_reverse('a', 'a')
  end

  it 'reverse two characters string' do
    assert_reverse('5h', 'h5')
  end

  it 'reverse three characters string' do
    assert_reverse('1;a', 'a;1')
  end

  it 'acceptance' do
    assert_reverse('oaic', 'ciao')
    assert_reverse('okrim oaic', 'ciao mirko')
    assert_reverse('odderf af iggo', 'oggi fa freddo')
  end

  private

  def assert_reverse(expected, original)
    expect(described_class.new.reverse_1(original.dup)).to eq(expected)
    expect(described_class.new.reverse_2(original.dup)).to eq(expected)
    expect(described_class.new.reverse_3(original.dup)).to eq(expected)
    expect(described_class.new.reverse_4(original.dup)).to eq(expected)
    expect(described_class.new.reverse_5(original.dup)).to eq(expected)
  end

end
