require_relative '../spec_helper'
require_relative '../../kata/sales_taxes/product_factory'

describe ProductFactory do

  it 'one not imported product without tax' do
    product = ProductFactory.new.create '1 book at 10.00'

    expect(product.description).to eq('1 book')
    expect(product.price).to eq(10.00)
    expect(product.taxes).to eq(0.00)
  end

  it 'one not imported product with tax' do
    product = ProductFactory.new.create '1 bottle of perfume at 10.00'

    expect(product.description).to eq('1 bottle of perfume')
    expect(product.price).to eq(10.00)
    expect(product.taxes).to eq(1.00)
  end

  it 'one imported product without tax' do
    product = ProductFactory.new.create '1 imported book at 10.00'

    expect(product.description).to eq('1 imported book')
    expect(product.price).to eq(10.00)
    expect(product.taxes).to eq(0.50)
  end

  it 'one imported product with tax' do
    product = ProductFactory.new.create '1 imported bottle of perfume at 10.00'

    expect(product.description).to eq('1 imported bottle of perfume')
    expect(product.price).to eq(10.00)
    expect(product.taxes).to eq(1.50)
  end

end
