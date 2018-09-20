require_relative 'lib/robot.rb'
require_relative 'lib/table.rb'
require_relative 'lib/robot_controller'

five_by_five_table = Table.new(5,5)
robot = Robot.new("test-robot")
robot_controller = RobotController.new(five_by_five_table,robot)
puts "Enter commands:"
commands = gets.chomp
robot_controller.set_commands(commands)
puts robot_controller.execute_commands
