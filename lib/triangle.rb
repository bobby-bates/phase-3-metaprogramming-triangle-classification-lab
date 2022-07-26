require 'pry'

class Triangle
  @lengths = []
  attr_accessor :length1, :length2, :length3

  def initialize length1, length2, length3
    @length1 = length1
    @length2 = length2
    @length3 = length3
    @lengths = [length1, length2, length3]
  end

  def kind
    # Check if it's actually a triangle
    if @lengths.all?(&:positive?) && triangle_inequality?
      find_triangle_type
    else
      raise TriangleError
    end
  end

  class TriangleError < StandardError
  end

  private

  def triangle_inequality?
    length1 + length2 > length3 && length2 + length3 > length1 && length1 + length3 > length2
  end

  def find_triangle_type
    # if @lengths.sum == @lengths.first * @lengths.count
    #   :equilateral
    # elsif length1 == length2 || length1 == length3 || length2 == length3
    #   :isosceles
    # else
    #   :scalene
    # end

    # Refactor:
    case @lengths.uniq.size
    when 1 then :equilateral
    when 2 then :isosceles
    else        :scalene
    end
  end
end
