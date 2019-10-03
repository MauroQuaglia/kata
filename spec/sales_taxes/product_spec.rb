require_relative '../spec_helper'
require_relative '../../kata/sales_taxes/product'

describe Product do

  it 'description of not imported_product' do
    product = Product.new '1 book', 10, 0

    expect(product.description).to eq('1 book')
  end

  it 'standard description of imported product' do
    product = Product.new '1 imported book', 10, 0

    expect(product.description).to eq('1 imported book')
  end

  it 'no standard description of imported product' do
    product = Product.new '1 book imported', 10, 0

    expect(product.description).to eq('1 imported book')
  end

  it 'miscellany' do
    product = Product.new '   2   MUSIC   CD   IMPORTED   ', 10, 0

    expect(product.description).to eq('2 imported MUSIC CD')
  end

end
