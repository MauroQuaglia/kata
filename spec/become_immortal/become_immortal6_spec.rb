require_relative '../spec_helper'
require_relative '../../kata/become_immortal/become_immortal6'

describe BecomeImmortal6 do
  let(:become_immortal) {BecomeImmortal6.new}

  describe '#max_power' do

    it 'should return the maximum power of two included' do
      expect(become_immortal.max_power(1)).to eq(0)
      expect(become_immortal.max_power(2)).to eq(1)
      expect(become_immortal.max_power(3)).to eq(1)
      expect(become_immortal.max_power(4)).to eq(2)
      expect(become_immortal.max_power(5)).to eq(2)
      expect(become_immortal.max_power(6)).to eq(2)
      expect(become_immortal.max_power(7)).to eq(2)
      expect(become_immortal.max_power(8)).to eq(3)
      expect(become_immortal.max_power(9)).to eq(3)
      expect(become_immortal.max_power(28827050410)).to eq(34)
      expect(become_immortal.max_power(35165045587)).to eq(35)
    end

  end

  describe '#sigma' do

    it 'should return the sum of first natural numbers' do
      expect(become_immortal.sigma(-2)).to eq(0)
      expect(become_immortal.sigma(-1)).to eq(0)
      expect(become_immortal.sigma(0)).to eq(0)
      expect(become_immortal.sigma(1)).to eq(0)
      expect(become_immortal.sigma(2)).to eq(1)
      expect(become_immortal.sigma(3)).to eq(3)
      expect(become_immortal.sigma(4)).to eq(6)
      expect(become_immortal.sigma(5)).to eq(10)
    end

  end

  describe '#positive_part' do

    it 'should return the positive part of a number' do
      expect(become_immortal.positive_part(-2)).to eq(0)
      expect(become_immortal.positive_part(-1)).to eq(0)
      expect(become_immortal.positive_part(0)).to eq(0)
      expect(become_immortal.positive_part(1)).to eq(1)
      expect(become_immortal.positive_part(2)).to eq(2)
    end

  end

  it 'codewars test simplified' do
    expect(become_immortal.elder_age_test(8, 5)).to eq(140)
    expect(become_immortal.elder_age_test(5, 8)).to eq(140)
    expect(become_immortal.elder_age_test(8, 8)).to eq(224)
    expect(become_immortal.elder_age_test(25, 31)).to eq(11925)
    expect(become_immortal.elder_age_test(31, 25)).to eq(11925)
    expect(become_immortal.elder_age_test(5, 45)).to eq(4968)
    expect(become_immortal.elder_age_test(45, 5)).to eq(4968)
    expect(become_immortal.elder_age_test(31, 39)).to eq(25596)
    expect(become_immortal.elder_age_test(39, 31)).to eq(25596)
    expect(become_immortal.elder_age_test(545, 435)).to eq(67374123)
    expect(become_immortal.elder_age_test(435, 545)).to eq(67374123)
  end

end