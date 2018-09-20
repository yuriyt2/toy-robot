class Robot

  def initialize(name)
    @name = name
    @current_direction = nil
    @compass = ["NORTH","EAST","SOUTH","WEST"]
  end

  attr_accessor  :current_direction, :name, :compass

  #move back one position in the array, if already at first position go to the end of the array (position 3)
  def left
    new_position = compass.index(current_direction) -1 >= 0 ? compass.index(current_direction) -1 : 3
    self.current_direction = compass[new_position]
  end

  #move forward one position in array, if at last position go to back to first (position 0)
  def right
    new_position = compass.index(current_direction) +1 < 4 ? compass.index(current_direction) +1 : 0
    self.current_direction = compass[new_position]
  end
end
