class Table

  def initialize(x,y)
    @max_length = x
    @max_height = y
    @robot_position = {}
  end

  attr_accessor :max_length, :max_height, :robot_position

  #add robot to table's robot_position hash with coordinates if coordinates are within the bounds of the table
  def place_robot(x,y,name)
    if (0..max_length).include?(x) && (0..max_height).include?(y)
      self.robot_position[name] = [x,y]
    end
  end

  #move the robot one space in the direction it is facing only if the resulting move is within the bounds of the table
  def move(robot_name,robot_direction)
      case robot_direction
      when "NORTH"
        self.robot_position[robot_name][1] +=1 if robot_position[robot_name][1] < max_height
      when "SOUTH"
        self.robot_position[robot_name][1] -=1 if robot_position[robot_name][1] > 0
      when "WEST"
        self.robot_position[robot_name][0] -=1 if robot_position[robot_name][0] > 0
      when "EAST"
        self.robot_position[robot_name][0] +=1 if robot_position[robot_name][0] < max_length
      else
        nil
      end
  end

end
