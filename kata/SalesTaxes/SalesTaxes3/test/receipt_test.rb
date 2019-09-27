require 'test-unit'
require '../receipt'

class ReceiptTest < Test::Unit::TestCase

  def test_formatting_receipt
    receipt = Receipt.new

    receipt.add('food', 10.00)
    receipt.add_taxes(1.00)
    receipt.add_total(11.00)

    assert_equal "food: 10.00\nSales Taxes: 1.00\nTotal: 11.00\n", receipt.print
  end

end

