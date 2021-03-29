class Players
  attr_reader :name, :points

  MAX_POINTS = 3

  def initialize name
    @name = name
    @points = MAX_POINTS
  end

  def red_points 
    @points -= 1
  end

  def dead?
    points <= 0 
  end

end
