require 'cuboid'

#This test is incomplete and, in fact, won't even run without errors.
#  Do whatever you need to do to make it work and please add your own test cases for as many
#  methods as you feel need coverage
describe Cuboid do

  describe "initialize" do
    it "creates a Cuboid with the correct dimensions" do
      cube = Cuboid.new(4, 4, 4)
      expect(cube.dimensions).to eq([4, 4, 4])
    end

    it "creates a Cuboid at the correct vertice" do
      cube = Cuboid.new(1, 1, 1, 8, 6, 4)
      expect(cube.tracking_vertice).to eq([8, 6, 4])
    end
  end

  describe "move_to" do
    let(:cube) { Cuboid.new(2, 2, 2) }
    it "moves Cuboid to new vertice" do
      cube.move_to!(3, 3, 3)
      expect(cube.tracking_vertice).to eq([3, 3, 3])
    end
  end

  describe "vertices" do
    let(:cube) { Cuboid.new }
    it "returns correct number of vertices" do
      expect(cube.vertices.length).to eq(8)
    end

    it "returns correct vertices" do
      vertices = [[0, 0, 0], [1, 0, 0], [0, 1, 0], [1, 1, 0],
                  [0, 0, 1], [1, 0, 1], [0, 1, 1], [1, 1, 1]]
      expect(cube.vertices.sort).to eq(vertices.sort)
    end
  end

  describe "intersects?" do
    let(:cube) { Cuboid.new(2, 2, 2) }
    let(:cube_2) { Cuboid.new(2, 2, 2, 1, 1, 1)}
    let(:cube_3) { Cuboid.new(2, 2, 2, 6, 6, 6)}

    it "returns true when Cuboids intersect" do
      expect(cube.intersects?(cube_2)).to eq(true)
    end

    it "returns false when Cuboids do not intersect" do
      expect(cube.intersects?(cube_3)).to eq(false)
    end
  end

end
