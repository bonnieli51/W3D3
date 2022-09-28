require 'byebug'

def range(start, last)
  # return array of nums in range
  return [] if start == last # 5,5

  [start] + range(start + 1, last)
end

# p range(1,5)
# p range(1,10)

def exponentiation_1(base, exp)
  return 1 if exp == 0

  base * exponentiation_1(base, exp - 1)
end

# p exponentiation_1(3,12)

def exponentiation_2(base, n)
  return 1 if n == 0
  return base if n == 1

  if n.even?
    exponentiation_2(base, n / 2)**2
  else
    base * (exponentiation_2(base, (n - 1) / 2)**2)
  end
end

# p exponentiation_2(2,5)
class Array
  def deep_dup
    result = []
    each do |ele| # ele is array
      result << if ele.is_a?(Array)
                  ele.deep_dup
                else
                  ele
                end
    end
    result
  end
end

# robot_parts = [
#   %w[nuts bolts washers],
#   %w[capacitors resistors inductors]
# ]

# robot_parts_copy = robot_parts.deep_dup
# # shouldn't modify robot_parts
# robot_parts_copy[1] << "LEDs"
# # but it does
# p robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]

# p [1, [2], [3, [4]]].deep_dup

def iter_fibonnaci(n)
  result = [0, 1, 1]
  return [0, 1].take(n) if n <= 2

  result << (result[-1] + result[-2]) while result.length != n
  result
end

# p iter_fibonnaci(0)

def rec_fibonnaci(n)
  return [0, 1].take(n) if n <= 2

  seq = rec_fibonnaci(n - 1)
  seq << (seq[-1] + seq[-2])
end

# p rec_fibonnaci(10)

def bsearch(arr, target)
  middle_value = arr[arr.length / 2]
  middle_index = arr.index(middle_value)
  left = arr[0...middle_index]
  right = arr[middle_index + 1..]

  return nil if arr.length == 1 && middle_value != target

  if target == middle_value
    arr.index(target)
  elsif target < middle_value
    bsearch(left, target)
  elsif target > middle_value
    return nil if bsearch(right, target).nil?

    (left.length + 1) + bsearch(right, target)
  end
end

p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil
