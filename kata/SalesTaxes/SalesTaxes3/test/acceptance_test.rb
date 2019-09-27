require 'test-unit'
require '../rounding'
require '../receipt'
require '../supermarket'
require '../shopper'
require '../product_factory'

class AcceptanceTest < Test::Unit::TestCase

  def setup
    @supermarket = Supermarket.new Rounding.new, Receipt.new, ProductFactory.new
  end

  def test_acceptance_1
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

  def test_acceptance_2
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

  def test_acceptance_3
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

    assert_equal output, @supermarket.receipt
  end

end
