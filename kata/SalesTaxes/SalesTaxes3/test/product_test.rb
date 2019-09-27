require 'test-unit'
require '../product'

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

end
