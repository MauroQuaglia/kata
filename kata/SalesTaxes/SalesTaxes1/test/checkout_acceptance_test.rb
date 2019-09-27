require 'test-unit'
require_relative '../receipt'
require_relative '../checkout'
require_relative '../categories'
require_relative '../import'
require_relative '../rounding'

class CheckoutAcceptanceTest < Test::Unit::TestCase

  def setup
    @checkout = Checkout.new Rounding.new, Receipt.new
  end

  def test_mixed_products_1
    @checkout.scan Book.new('book', 12.49)
    @checkout.scan Music.new('music CD', 14.99)
    @checkout.scan Food.new('chocolate bar', 0.85)

    assert_receipt_include_line('1 book: 12.49')
    assert_receipt_include_line('1 music CD: 16.49')
    assert_receipt_include_line('1 chocolate bar: 0.85')
    assert_receipt_include_line('Sales Taxes: 1.50')
    assert_receipt_include_line('Total: 29.83')
  end

  def test_mixed_products_2
    @checkout.scan Import.new Food.new('box of chocolates', 10.00)
    @checkout.scan Import.new Cosmetic.new('bottle of perfume', 47.50)

    assert_receipt_include_line('1 imported box of chocolates: 10.50')
    assert_receipt_include_line('1 imported bottle of perfume: 54.65')
    assert_receipt_include_line('Sales Taxes: 7.65')
    assert_receipt_include_line('Total: 65.15')
  end

  def test_mixed_products_3
    @checkout.scan Import.new Cosmetic.new('bottle of perfume', 27.99)
    @checkout.scan Cosmetic.new('bottle of perfume', 18.99)
    @checkout.scan Food.new('packet of headache pills', 9.75)
    @checkout.scan Import.new Food.new('box of imported chocolates', 11.25)

    assert_receipt_include_line('1 imported bottle of perfume: 32.19')
    assert_receipt_include_line('1 bottle of perfume: 20.89')
    assert_receipt_include_line('1 packet of headache pills: 9.75')
    assert_receipt_include_line('1 imported box of chocolates: 11.85')
    assert_receipt_include_line('Sales Taxes: 6.70')
    assert_receipt_include_line('Total: 74.68')
  end

  def assert_receipt_include_line(entry)
    receipt = @checkout.receipt

    assert receipt.include?(entry + "\\n"), receipt
  end

end