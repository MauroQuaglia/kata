require_relative '../spec_helper'
require_relative '../../kata/become_immortal/become_immortal1'
require_relative '../../kata/become_immortal/become_immortal2'
require_relative '../../kata/become_immortal/become_immortal3'
require_relative '../../kata/become_immortal/become_immortal4'
require_relative '../../kata/become_immortal/become_immortal5'

describe "BecomeImmortal" do
  let(:become_immortal1) {BecomeImmortal1.new}
  let(:become_immortal2) {BecomeImmortal2.new}
  let(:become_immortal3) {BecomeImmortal3.new}
  let(:become_immortal4) {BecomeImmortal4.new}
  let(:become_immortal5) {BecomeImmortal5.new}

  subject {become_immortal3}

  it 'codewars test' do
    expect(subject.elder_age(8, 5, 1, 100)).to eq(5)
    expect(subject.elder_age(5, 8, 1, 100)).to eq(5)
    expect(subject.elder_age(8, 8, 0, 100007)).to eq(224)
    expect(subject.elder_age(25, 31, 0, 100007)).to eq(11925)
    expect(subject.elder_age(31, 25, 0, 100007)).to eq(11925)
    expect(subject.elder_age(5, 45, 3, 1000007)).to eq(4323)
    expect(subject.elder_age(45, 5, 3, 1000007)).to eq(4323)
    expect(subject.elder_age(31, 39, 7, 2345)).to eq(1586)
    expect(subject.elder_age(39, 31, 7, 2345)).to eq(1586)
    expect(subject.elder_age(545, 435, 342, 1000007)).to eq(808451)
    expect(subject.elder_age(435, 545, 342, 1000007)).to eq(808451)
  end

  it '#first_row_donation' do
    expect(become_immortal2.first_row_donation(1, 0)).to eq(0)
    expect(become_immortal2.first_row_donation(2, 0)).to eq(1)
    expect(become_immortal2.first_row_donation(3, 0)).to eq(3)
    expect(become_immortal2.first_row_donation(4, 0)).to eq(6)
    expect(become_immortal2.first_row_donation(1, 1)).to eq(0)
    expect(become_immortal2.first_row_donation(2, 1)).to eq(0)
    expect(become_immortal2.first_row_donation(3, 1)).to eq(1)
    expect(become_immortal2.first_row_donation(4, 1)).to eq(3)
    expect(become_immortal2.first_row_donation(1, 2)).to eq(0)
    expect(become_immortal2.first_row_donation(2, 2)).to eq(0)
    expect(become_immortal2.first_row_donation(3, 2)).to eq(0)
    expect(become_immortal2.first_row_donation(4, 2)).to eq(1)
    expect(become_immortal2.first_row_donation(1, 3)).to eq(0)
    expect(become_immortal2.first_row_donation(2, 3)).to eq(0)
    expect(become_immortal2.first_row_donation(3, 3)).to eq(0)
    expect(become_immortal2.first_row_donation(4, 3)).to eq(0)
  end

  it '#first_column_donation' do
    expect(become_immortal2.first_column_donation(1, 0)).to eq(0)
    expect(become_immortal2.first_column_donation(2, 0)).to eq(1)
    expect(become_immortal2.first_column_donation(3, 0)).to eq(3)
    expect(become_immortal2.first_column_donation(4, 0)).to eq(6)
    expect(become_immortal2.first_column_donation(1, 1)).to eq(0)
    expect(become_immortal2.first_column_donation(2, 1)).to eq(0)
    expect(become_immortal2.first_column_donation(3, 1)).to eq(1)
    expect(become_immortal2.first_column_donation(4, 1)).to eq(3)
    expect(become_immortal2.first_column_donation(1, 2)).to eq(0)
    expect(become_immortal2.first_column_donation(2, 2)).to eq(0)
    expect(become_immortal2.first_column_donation(3, 2)).to eq(0)
    expect(become_immortal2.first_column_donation(4, 2)).to eq(1)
    expect(become_immortal2.first_column_donation(1, 3)).to eq(0)
    expect(become_immortal2.first_column_donation(2, 3)).to eq(0)
    expect(become_immortal2.first_column_donation(3, 3)).to eq(0)
    expect(become_immortal2.first_column_donation(4, 3)).to eq(0)
  end

  it 'edge cases' do
    expect(become_immortal3.elder_age(1, 1, 0, 1)).to eq(0)
    expect(become_immortal3.elder_age(1, 2, 0, 1)).to eq(0)
    expect(become_immortal3.elder_age(2, 1, 0, 1)).to eq(0)
    expect(become_immortal3.elder_age(2, 2, 0, 2)).to eq(0)
  end

end