require_relative '../spec_helper'
require_relative '../../kata/back_to_the_checkout/checkout'

describe Checkout do

  it 'should execute total tests' do
    expect(price('')).to eq(0)
    expect(price('A')).to eq(50)
    expect(price('AB')).to eq(80)
    expect(price('CDBA')).to eq(115)
    expect(price('AA')).to eq(100)
    expect(price('AAA')).to eq(130)
    expect(price('AAAA')).to eq(180)
    expect(price('AAAAA')).to eq(230)
    expect(price('AAAAAA')).to eq(260)
    expect(price('AAAB')).to eq(160)
    expect(price('AAABB')).to eq(175)
    expect(price('AAABBD')).to eq(190)
    expect(price('DABABA')).to eq(190)
  end

  it 'should execute incremental tests' do
    co = described_class.new(rules)

    expect(co.total).to eq(0)

    co.scan('A');
    expect(co.total).to eq(50)

    co.scan('B');
    expect(co.total).to eq(80)

    co.scan('A');
    expect(co.total).to eq(130)

    co.scan('A');
    expect(co.total).to eq(160)

    co.scan('B');
    expect(co.total).to eq(175)
  end

  private

  def price(goods)
    co = described_class.new(rules)
    goods.split(//).each {|item| co.scan(item)}
    co.total
  end

  def rules
    {
        'A' => [50, 50, 30],
        'B' => [30, 15],
        'C' => [20],
        'D' => [15]
    }
  end

end