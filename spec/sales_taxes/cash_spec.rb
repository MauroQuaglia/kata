require_relative '../spec_helper'
require_relative '../../kata/sales_taxes/cash'
require_relative '../../kata/sales_taxes/rounding'
require_relative '../../kata/sales_taxes/product'
require_relative '../../spec/sales_taxes/fake_receipt'

describe Cash do

  before do
    @receipt = FakeReceipt.new
    @checkout = Cash.new Rounding.new, @receipt
  end

  it 'one not imported product without tax' do
    @checkout.scan Product.new('book', 10.00, 0)

    assert_receipt_values('book', 0, 10.00)
  end

  it 'one not imported product with tax' do
    @checkout.scan Product.new('bottle of perfume', 10.00, 10)

    assert_receipt_values('bottle of perfume', 1.00, 11.00)
  end

  private

  def assert_receipt_values(description, taxes, total)
    @checkout.receipt

    expect(@receipt.description).to eq(description)
    expect(@receipt.taxes).to eq(taxes)
    expect(@receipt.total).to eq(total)
  end

end
