class Squares
  attr_reader :x

  def initialize(x)
    @x = x
  end

  def square_of_sum
    sum1 = 0
    for i in 1..x
      sum1 += i
    end
    return sum1 ** 2
  end

  def sum_of_squares
    sum2 = 0
    for i in 1..x
      sum2 += i ** 2
    end
    return sum2
  end

  def difference
    return square_of_sum - sum_of_squares
  end

end

module BookKeeping
  VERSION = 4
end
