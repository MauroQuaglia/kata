require 'test-unit'
require_relative '../product'

class ProductTest < Test::Unit::TestCase

  def test_description_of_not_imported_product
    product = Product.new '1 book', 10, 0

    assert_equal '1 book', product.description
  end

  def test_standard_description_of_imported_product
    product = Product.new '1 imported book', 10, 0

    assert_equal '1 imported book', product.description
  end

  def test_no_standard_description_of_imported_product
    product = Product.new '1 book imported', 10, 0

    assert_equal '1 imported book', product.description
  end

  def test_miscellany
    product = Product.new '   2   MUSIC   CD   IMPORTED   ', 10, 0

    assert_equal '2 imported MUSIC CD', product.description
  end

end
