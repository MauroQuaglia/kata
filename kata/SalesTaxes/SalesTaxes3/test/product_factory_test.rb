require 'test-unit'
require '../product_factory'

class ProductFactoryTest < Test::Unit::TestCase

  def test_one_not_imported_product_without_tax
    product = ProductFactory.new.create '1 book at 10.00'

    assert_equal '1 book', product.description
    assert_equal 10.00, product.price
    assert_equal 0.00, product.taxes
  end

  def test_one_not_imported_product_with_tax
    product = ProductFactory.new.create '1 bottle of perfume at 10.00'

    assert_equal '1 bottle of perfume', product.description
    assert_equal 10.00, product.price
    assert_equal 1.00, product.taxes
  end

  def test_one_imported_product_without_tax
    product = ProductFactory.new.create '1 imported book at 10.00'

    assert_equal '1 imported book', product.description
    assert_equal 10.00, product.price
    assert_equal 0.50, product.taxes
  end

  def test_one_imported_product_with_tax
    product = ProductFactory.new.create '1 imported bottle of perfume at 10.00'

    assert_equal '1 imported bottle of perfume', product.description
    assert_equal 10.00, product.price
    assert_equal 1.50, product.taxes
  end

end
