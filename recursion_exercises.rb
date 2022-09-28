require "byebug"
def range(start, last)
    #return array of nums in range
   return [] if start == last # 5,5
   [start] +  range(start +1, last)
end

# p range(1,5)
# p range(1,10)

def exponentiation_1(base, exp) 
    return 1 if exp == 0
    base * exponentiation_1(base,exp-1)

end

# p exponentiation_1(3,12)

def exponentiation_2(base, n)
    return 1 if n == 0
    return base if n == 1
    if n.even?
        exponentiation_2(base, n/2)**2
    else
        base * (exponentiation_2(base, (n - 1)/2)**2)
    end
end

# p exponentiation_2(2,5)
class Array
    def deep_dup
        result = []
        self.each do |ele| # ele is array
            
            if ele.is_a?(Array)
                result << ele.deep_dup
            else
                result << ele
            end

        end
        result
    end
end

robot_parts = [
  ["nuts", "bolts", "washers"],
  ["capacitors", "resistors", "inductors"]
]

# robot_parts_copy = robot_parts.deep_dup
# # shouldn't modify robot_parts
# robot_parts_copy[1] << "LEDs"
# # but it does
# p robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]

p [1, [2], [3, [4]]].deep_dup