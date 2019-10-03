require_relative '../spec_helper'
require_relative '../../kata/sales_taxes/rounding'
require_relative '../../kata/sales_taxes/receipt'
require_relative '../../kata/sales_taxes/product_factory'
require_relative '../../kata/sales_taxes/supermarket'
require_relative '../../kata/sales_taxes/shopper'

describe 'Acceptance' do

  before do
    rounding = Rounding.new(0.05)
    receipt = Receipt.new(2)
    @supermarket = Supermarket.new rounding, receipt, ProductFactory.new
  end

  it 'test acceptance 1' do
    input = <<-I
1 book at 12.49
1 music CD at 14.99
1 chocolate bar at 0.85
    I
    output = <<-O
1 book: 12.49
1 music CD: 16.49
1 chocolate bar: 0.85
Sales Taxes: 1.50
Total: 29.83
    O

    assert_receipt(input, output)
  end

  it 'test acceptance 2' do
    input = <<-I
1 imported box of chocolates at 10.00
1 imported bottle of perfume at 47.50
    I
    output = <<-O
1 imported box of chocolates: 10.50
1 imported bottle of perfume: 54.65
Sales Taxes: 7.65
Total: 65.15
    O

    assert_receipt(input, output)
  end

  it 'test acceptance 3' do
    input = <<-I
1 imported bottle of perfume at 27.99
1 bottle of perfume at 18.99
1 packet of headache pills at 9.75
1 box of imported chocolates at 11.25
    I
    output = <<-O
1 imported bottle of perfume: 32.19
1 bottle of perfume: 20.89
1 packet of headache pills: 9.75
1 imported box of chocolates: 11.85
Sales Taxes: 6.70
Total: 74.68
    O

    assert_receipt(input, output)
  end

  private

  def assert_receipt(input, output)
    @supermarket.checkout(Shopper.new(input))

    expect(@supermarket.receipt).to eq(output)
  end

end
