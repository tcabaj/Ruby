require 'simplecov'
SimpleCov.start

require_relative '../lib/mergeSort'

RSpec.describe 'mergeSort.rb' do
  describe '#mergeSort' do
    let(:random_arr) { Array.new(10) { rand(100) } }
    let(:sorted_random_arr) { random_arr.sort }
    it 'should be initialized' do
      expect { merge_sort([]) }.not_to raise_error
    end
    it 'should sort an unsorted array' do
      expect(merge_sort([6, 3, 5, 4, 5, 0, 5, 3, 3, 6])).to eq([0, 3, 3, 3, 4, 5, 5, 5, 6, 6])
      expect(merge_sort([9, 8, 7, 6, 5, 4, 3, 2, 1, 0])).to eq([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
    it 'should sort an unsorted array with "0"' do
      expect(merge_sort([10, 0, 5, 4])).to eq([0, 4, 5, 10])
    end
    it 'should sort an unsorted random array' do
      expect(merge_sort(random_arr)).to eq(sorted_random_arr)
    end
    it 'should sort negative numbers' do
      expect(merge_sort([-1, -2, -1])).to match([-2, -1, -1])
    end
    it 'should sort negative and positive numbers' do
      expect(merge_sort([-1, -2, -1])).to match([-2, -1, -1])
    end
    it 'should sort floating point numbers' do
      expect(merge_sort([12.2, 0.23, 5.6])).to eq([0.23, 5.6, 12.2])
    end
    it 'should return an empty array, when given zero elements' do
      expect(merge_sort([])).to eq([])
    end
    it 'should handle single element arrays' do
      expect(merge_sort([9])).to eq([9])
    end
    it 'should handle single negative number' do
      expect(merge_sort([-9])).to eq([-9])
    end
    it 'should handle single letter' do
      expect(merge_sort(['a'])).to eq(['a'])
    end
    it 'should sort an already sorted array' do
      expect(merge_sort([0, 4, 5, 10])).to eq([0, 4, 5, 10])
    end
    it 'should sort an already sorted random array' do
      expect(merge_sort(sorted_random_arr)).to eq(sorted_random_arr)
    end
    it 'should handle small unsorted arrays' do
      expect(merge_sort([2, 1])).to eq([1, 2])
    end
    it 'should handle simple unsorted arrays' do
      expect(merge_sort([3, 2, 1])).to eq([1, 2, 3])
    end
    it 'should sort letter' do
      expect(merge_sort(['f', 'g', 'b', 'd', 'a', 'e', 'h', 'c'])).to match(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'])
    end
    it 'sort nil array' do
      expect(merge_sort([nil])).to match([nil])
    end
  end
end
