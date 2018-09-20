class RobotController

  def initialize(table,robot)
    @table = table
    @robot = robot
    @commands = nil
  end

  attr_accessor :table, :robot, :commands

  def set_commands(commands)
    self.commands = commands.split(" ")
  end

  def report
    return "#{table.robot_position[robot.name][0]},#{table.robot_position[robot.name][1]},#{robot.current_direction}"
  end

  #checks that the place command was submitted correctly.  checks that there are 2 numbers and a coordinate form the compass.
  def valid_place?(coords)
    if coords[0].to_i.to_s == coords[0] && coords[1].to_i.to_s == coords[1] && robot.compass.member?(coords[2])
      return true
    else
      return false
    end
  end

  #recursively go through commands given and place, rotate or move the robot as instructed.  only report or move/rotate robot if it has been successfully placed first.
  def execute_commands
    if commands.length < 1
      return nil
    end

    case commands[0]
    when "PLACE"
      coords = commands[1].split(",")
      if valid_place?(coords)
        table.place_robot(coords[0].to_i,coords[1].to_i,robot.name)
        robot.current_direction = coords[2]
        self.commands = commands.drop(2)
      else
        self.commands = commands.drop(1)
      end
    when "REPORT"
      return report if robot.current_direction
      self.commands = commands.drop(1)
    when "LEFT"
      robot.left if robot.current_direction
      self.commands = commands.drop(1)
    when "RIGHT"
      robot.right if robot.current_direction
      self.commands = commands.drop(1)
    when "MOVE"
       table.move(robot.name,robot.current_direction) if table.robot_position[robot.name]
      self.commands = commands.drop(1)
    else
      self.commands = commands.drop(1)
    end

    execute_commands
  end
end
