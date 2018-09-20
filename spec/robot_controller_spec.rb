require 'robot'
require 'table'
require 'robot_controller'

describe RobotController do
  describe "create controller" do
    before(:context) do
      @table = Table.new(5,5)
      @robot = Robot.new("Timmy")
      @robot_controller = RobotController.new(@table,@robot)
    end
    context "new controller with 5x5 table and robot named Timmy" do
      it "returns robot name, max length and max height" do
        expect([@robot_controller.robot.name,@robot_controller.table.max_height,@robot_controller.table.max_length]).to eql(["Timmy",5,5])
      end
    end
  end

  describe "receive commands" do
    before(:context) do
      @table = Table.new(5,5)
      @robot = Robot.new("Timmy")
      @robot_controller = RobotController.new(@table,@robot)
      @robot_controller.set_commands("TEST TEST")
    end
    context "receive command TEST TEST" do
      it "returns TEST TEST in split array" do
        expect(@robot_controller.commands).to eql(["TEST","TEST"])
      end
    end
  end

  describe "execute commands with placed robot and report only" do
    before(:context) do
      @table = Table.new(5,5)
      @robot = Robot.new("Timmy")
      @robot_controller = RobotController.new(@table,@robot)
      @robot_controller.set_commands("PLACE 1,2,NORTH REPORT")
    end
    context "receive command PLACE 1,2,NORTH REPORT" do
      it "returns 1,2,NORTH" do
        expect(@robot_controller.execute_commands).to eql("1,2,NORTH")
      end
    end
  end

  describe "execute commands with placed robot and rotate move commands" do
    before(:context) do
      @table = Table.new(5,5)
      @robot = Robot.new("Timmy")
      @robot_controller = RobotController.new(@table,@robot)
      @robot_controller.set_commands("PLACE 1,2,NORTH LEFT MOVE MOVE LEFT MOVE MOVE REPORT")
    end
    context "receive command PLACE 1,2,NORTH LEFT MOVE MOVE LEFT MOVE MOVE REPORT" do
      it "returns 0,0,SOUTH" do
        expect(@robot_controller.execute_commands).to eql("0,0,SOUTH")
      end
    end
  end

  describe "execute commands with robot placed twice" do
    before(:context) do
      @table = Table.new(5,5)
      @robot = Robot.new("Timmy")
      @robot_controller = RobotController.new(@table,@robot)
      @robot_controller.set_commands("PLACE 1,2,NORTH LEFT MOVE PLACE 4,2,EAST REPORT")
    end
    context "receive command PLACE 1,2,NORTH LEFT MOVE PLACE 4,2,EAST REPORT" do
      it "returns 4,2,EAST" do
        expect(@robot_controller.execute_commands).to eql("4,2,EAST")
      end
    end
  end

  describe "execute commands with robot not placed" do
    before(:context) do
      @table = Table.new(5,5)
      @robot = Robot.new("Timmy")
      @robot_controller = RobotController.new(@table,@robot)
      @robot_controller.set_commands("LEFT RIGHT MOVE REPORT")
    end
    context "receive commands LEFT RIGHT MOVE REPORT without placing robot" do
      it "returns nil" do
        expect(@robot_controller.execute_commands).to eql(nil)
      end
    end
  end


end
