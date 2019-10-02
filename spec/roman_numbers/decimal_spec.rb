require_relative '../spec_helper'
require_relative '../../kata/roman_numbers/decimal1'
require_relative '../../kata/roman_numbers/decimal2'

describe 'Decimal' do

  it 'one' do
    assert_decimal(1, 'I')
  end

  it 'two' do
    assert_decimal(2, 'II')
  end

  it 'three' do
    assert_decimal(3, 'III')
  end

  it 'four' do
    assert_decimal(4, 'IV')
  end

  it 'five' do
    assert_decimal(5, 'V')
  end

  it 'six' do
    assert_decimal(6, 'VI')
  end

  private

  def assert_decimal(decimal, roman)
    expect(Decimal1.new.to_roman(decimal)).to eq(roman)
    expect(Decimal2.new.to_roman(decimal)).to eq(roman)
  end

end
