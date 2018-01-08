require 'byebug'

class Cuboid
  attr_reader :tracking_vertice, :dimensions

  def initialize(length = 1, width = 1, height = 1, x = 0, y = 0, z = 0)
    @tracking_vertice = [x, y, z]
    @dimensions = [length, width, height]
  end
  #BEGIN public methods that should be your starting point

  def move_to!(x, y, z)
    @tracking_vertice = [x, y, z]
  end

  def vertices
    vertices_list = [@tracking_vertice]
    # vertices_list
    #[a + x, b, c], [a, b + y, c + z],
    #[a, b + y, c], [a + x, b, c + z],
    #[a, b, c + z], [a + x, b + y, c + z],
    #[a, b, c], [a + x, b + y, c + z]

    @dimensions.each_with_index do |dim, i|
      temp = @tracking_vertice.dup
      temp_2 = @tracking_vertice.dup

      temp[i] += dim
      vertices_list << temp

      temp_2.each_with_index do |vert, j|
        unless j == i
          temp_2[j] += @dimensions[j]
        end
      end
      vertices_list << temp_2
    end

    final = @tracking_vertice.dup
    k = 0
    while k < final.length
      final[k] += @dimensions[k]
      k += 1
    end
    vertices_list << final
    vertices_list
  end

  #returns true if the two cuboids intersect each other.  False otherwise.
  def intersects?(other)
    temp = other.tracking_vertice.dup
    low = temp.dup
    i = 0
    while i < temp.length
      temp[i] += other.dimensions[i]
      i += 1
    end
    high = temp

    self.vertices.each do |vert|
      result = []
      j = 0
      while j < low.length
        if vert[j] >= low[j] && vert[j] <= high[j]
          result << true
        end
        j += 1
      end
      return true if result[0] && result[1] && result[2]
    end
    false
  end


  #END public methods that should be your starting point
end
