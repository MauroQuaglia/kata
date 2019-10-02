require_relative '../spec_helper'
require_relative '../../kata/job_interview/array_util'

describe ArrayUtil do

  context '#count5' do

    it 'empty array' do
      assert_count5(0, [])
    end

    it 'one element less than 5' do
      assert_count5(0, [2])
    end

    it 'one element greater than 5' do
      assert_count5(1, [6])
    end

    it 'acceptance' do
      assert_count5(1, [2, 9, 2, 3, 5])
      assert_count5(3, [6, 7, 8])
      assert_count5(0, [1, 3, 5])
    end

    private

    def assert_count5(expected, original)
      expect(described_class.new.count5_1(original)).to eq(expected)
      expect(described_class.new.count5_2(original)).to eq(expected)
    end

  end

  context '#sum_odd_elements' do

    it 'empty array' do
      assert_sum_odd_elements(0, [])
    end

    it 'one element array' do
      assert_sum_odd_elements(0, [5])
    end

    it 'two elements array' do
      assert_sum_odd_elements(2, [5, 2])
    end

    it 'three elements array' do
      assert_sum_odd_elements(2, [5, 2, 4])
    end

    it 'acceptance' do
      assert_sum_odd_elements(9, [1, 2, 3, 7])
    end

    private

    def assert_sum_odd_elements(expected, original)
      expect(described_class.new.sum_odd_elements_1(original)).to eq(expected)
      expect(described_class.new.sum_odd_elements_2(original)).to eq(expected)
    end

  end


end