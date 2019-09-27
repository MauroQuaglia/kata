require 'test-unit'
require_relative '../checkout'
require_relative '../rounding'
require_relative 'fake_receipt'
require_relative '../product'

class CheckoutTest < Test::Unit::TestCase

  def setup
    @receipt = FakeReceipt.new
    @checkout = Checkout.new Rounding.new, @receipt
  end

  def test_one_not_imported_product_without_tax
    @checkout.scan Product.new('book', 10.00, 0)

    assert_receipt_values('book', 0, 10.00)
  end

  def test_one_not_imported_product_with_tax
    @checkout.scan Product.new('bottle of perfume', 10.00, 10)

    assert_receipt_values('bottle of perfume', 1.00, 11.00)
  end

  private

  def assert_receipt_values(description, taxes, total)
    @checkout.receipt
    assert_equal description, @receipt.description
    assert_equal taxes, @receipt.taxes
    assert_equal total, @receipt.total
  end

end
