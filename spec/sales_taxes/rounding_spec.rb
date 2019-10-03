require_relative '../spec_helper'
require_relative '../../kata/sales_taxes/rounding'

describe Rounding do

  it 'rounding up' do
    rounding = Rounding.new(0.05)

    expect(rounding.up(0)).to eq(0)
    expect(rounding.up(0.025)).to eq(0.05)
    expect(rounding.up(0.050)).to eq(0.05)
    expect(rounding.up(0.075)).to eq(0.10)
    expect(rounding.up(0.100)).to eq(0.10)
  end

  it 'no rounding' do
    rounding = Rounding.new(0)

    expect(rounding.up(0)).to eq(0)
    expect(rounding.up(0.50)).to eq(0.50)
    expect(rounding.up(1.00)).to eq(1.00)
  end

end

