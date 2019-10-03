require_relative '../spec_helper'
require_relative '../../kata/sales_taxes/shopper'

describe Shopper do

  it 'one good' do
    shopping_list = 'a'

    shopper = Shopper.new(shopping_list)

    expect(shopper.goods.length).to eq(1)
    expect(shopper.goods[0]).to eq('a')
  end

  it 'two goods' do
    shopping_list = "a\nb"

    shopper = Shopper.new(shopping_list)

    expect(shopper.goods.length).to eq(2)
    expect(shopper.goods[0]).to eq('a')
    expect(shopper.goods[1]).to eq('b')
  end

end
