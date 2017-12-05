require 'spec_helper'

describe '#square_of_sum' do
  it 'returns 1 for 1' do
    expect(Squares.new(1).square_of_sum).to eq 1
  end

  it 'returns 3025 for 10' do
    expect(Squares.new(10).square_of_sum).to eq 3025
  end

  it 'returns 255_025_00 for 100' do
    expect(Squares.new(100).square_of_sum).to eq 255_025_00
  end
end

describe '#sum_of_squares' do
  it 'returns 1 for 1' do
    expect(Squares.new(1).sum_of_squares).to eq 1
  end

  it 'returns 385 for 10' do
    expect(Squares.new(10).sum_of_squares).to eq 385
  end

  it 'returns 338_350 for 100' do
    expect(Squares.new(100).sum_of_squares).to eq 338_350
  end
end

describe '#difference_of_squares' do
  it 'returns 0 for 1' do
    expect(Squares.new(1).difference).to eq 0
  end

  it 'returns 2640 for 10' do
    expect(Squares.new(10).difference).to eq 2640
  end

  it 'returns 25_164_150 for 100' do
    expect(Squares.new(100).difference).to eq 25_164_150
  end
end
