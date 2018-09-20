require 'table'

describe Table do
  describe "create 5x4 table" do
    before(:context) do
      @table = Table.new(5,4)
    end
    context "max height and length set to size of table" do
      it "returns max h/l of 5,4" do
        expect([@table.max_length,@table.max_height]).to eql([5,4])
      end
    end
  end

  describe "place a robot in valid table position" do
    before(:context) do
      @table = Table.new(5,4)
      @table.place_robot(2,3,"Timmy")
    end
    context "place robot Timmy at 2,3" do
      it "returns coordinates 2,3" do
        expect(@table.robot_position["Timmy"]).to eql([2,3])
      end
    end
  end

  describe "place a robot in invalid table position" do
    before(:context) do
      @table = Table.new(5,4)
      @table.place_robot(2,5,"Timmy")
      @table.place_robot(6,2,"Jimmy")
      @table.place_robot(-1,2,"Kimmy")
      @table.place_robot(2,-2,"Fimmy")
    end
    context "try to place robots at positions outside table on all 4 dimensions" do
      it "table robot_position returns empty hash (no robots placed)" do
        expect(@table.robot_position).to eql({})
      end
    end
  end

  describe "move robot within table N/E" do
    before(:context) do
      @table = Table.new(5,5)
      @table.place_robot(2,3,"Timmy")
      @table.move("Timmy","NORTH")
      @table.move("Timmy","EAST")
    end
    context "robot placed on 2,3 move 1 move north and 1 move east" do
      it "returns new coordinates 3,4" do
        expect(@table.robot_position["Timmy"]).to eql([3,4])
      end
    end
  end

  describe "move robot within table S/W" do
    before(:context) do
      @table = Table.new(5,5)
      @table.place_robot(2,3,"Timmy")
      @table.move("Timmy","SOUTH")
      @table.move("Timmy","WEST")
    end
    context "robot placed on 2,3 move 1 move south and 1 move west" do
      it "returns new coordinates 1,2" do
        expect(@table.robot_position["Timmy"]).to eql([1,2])
      end
    end
  end

  describe "move robot off table N/E" do
    before(:context) do
      @table = Table.new(5,5)
      @table.place_robot(5,5,"Timmy")
      @table.move("Timmy","NORTH")
      @table.move("Timmy","EAST")
    end
    context "robot placed on 5,5 move 1 move north and 1 move east" do
      it "returns same coordinates, 5,5" do
        expect(@table.robot_position["Timmy"]).to eql([5,5])
      end
    end
  end

  describe "move robot off table S/W" do
    before(:context) do
      @table = Table.new(5,5)
      @table.place_robot(0,0,"Timmy")
      @table.move("Timmy","SOUTH")
      @table.move("Timmy","WEST")
    end
    context "robot placed on 0,0 move 1 move south and 1 move west" do
      it "returns same coordinates, 5,5" do
        expect(@table.robot_position["Timmy"]).to eql([0,0])
      end
    end
  end
end
