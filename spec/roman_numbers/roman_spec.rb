require_relative '../spec_helper'
require_relative '../../kata/roman_numbers/roman'

describe Roman do

  it 'acceptance' do
    assert_roman('I', 1)
    assert_roman('II', 2)
    assert_roman('III', 3)
    assert_roman('IV', 4)
    assert_roman('V', 5)
    assert_roman('VI', 6)
    assert_roman('VII', 7)
    assert_roman('VIII', 8)
    assert_roman('IX', 9)
    assert_roman('X', 10)
  end

  private

  def assert_roman(roman, decimal)
    expect(described_class.new.to_decimal(roman)).to eq(decimal)
    expect(described_class.new.to_decimal2(roman)).to eq(decimal)
  end

end

