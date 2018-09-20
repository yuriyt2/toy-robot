require "robot"
  describe Robot do
    describe "make robot" do
      before(:context) do
        @robot = Robot.new("Timmy")
      end
      context "creates new robot with name Timmy" do
        it "return Timmy" do
          expect(@robot.name).to eql("Timmy")
        end
      end
    end
    describe "change robot's direction on table L" do
      before(:context) do
        @robot = Robot.new("Timmy")
        @robot.current_direction = "NORTH"
      end
      context "give a robot direction NORTH then turn LEFT" do
        it "returns WEST" do
          expect(@robot.left).to eql("WEST")
        end
      end
    end

    describe "change robot's direction on table R" do
      before(:context) do
        @robot = Robot.new("Timmy")
        @robot.current_direction = "WEST"
      end
      context "give a robot direction WEST then turn RIGHT" do
        it "returns NORTH" do
          expect(@robot.right).to eql("NORTH")
        end
      end
    end
  end
