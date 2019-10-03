require_relative '../spec_helper'
require_relative '../../kata/sales_taxes/receipt'

describe Receipt do

  it 'formatting receipt' do
    receipt = Receipt.new

    receipt.add('food', 10.00)
    receipt.add_taxes(1.00)
    receipt.add_total(11.00)

    expect(receipt.print).to eq("food: 10.00\nSales Taxes: 1.00\nTotal: 11.00\n")
  end

end

