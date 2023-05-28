class Triangle
  class TriangleError < StandardError
  end

  attr_reader :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    validate_triangle

    if equilateral?
      :equilateral
    elsif isosceles?
      :isosceles
    else
      :scalene
    end
  end

  private

  def validate_triangle
    validate_positive_sides
    validate_triangle_inequality
  end

  def validate_positive_sides
    raise TriangleError, 'Triangle sides must be positive' unless side1.positive? && side2.positive? && side3.positive?
  end

  def validate_triangle_inequality
    raise TriangleError, 'Invalid triangle: Triangle inequality violated' unless (side1 + side2 > side3) && (side1 + side3 > side2) && (side2 + side3 > side1)
  end

  def equilateral?
    side1 == side2 && side2 == side3
  end

  def isosceles?
    side1 == side2 || side2 == side3 || side1 == side3
  end
end