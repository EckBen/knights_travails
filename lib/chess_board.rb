class Space
  attr_accessor :value, :neighbors

  def initialize(value)
    @value = value
    @neighbors = populate_neighbors(value)
  end

  def populate_neighbors(coordinates)
    x = coordinates[0] + 2
    y = coordinates[1] + 2
    nodes = []

    5.times do
      if x > 7 || x < 0
        x -= 1
        next
      end

      if x != coordinates[0] 
        5.times do
          if y > 7 || y < 0
            y -= 1
            next
          end
          
          if x == coordinates[0] - 1 || x == coordinates[0] + 1
            if y == coordinates[1] - 2 || y == coordinates[1] + 2
              nodes << [x,y]
            end
          else
            if y == coordinates[1] + 1 || y == coordinates[1] - 1
              nodes << [x,y]
            end
          end

          y -= 1
        end
        
        y = coordinates[1] + 2
      end
      
      x -= 1
    end

    nodes
  end
end

class Board < Space
  attr_reader :spaces
  
  def initialize
    @spaces = self.populate_board
  end

  def populate_board
    spaces = []

    8.times do |i|
      8.times do |j|
        spaces << Space.new([i,j])
      end
    end

    spaces
  end
end