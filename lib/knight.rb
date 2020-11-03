require './chess_board.rb'

class Knight < Board
  def knight_moves(position, destination)
    current_space = find_space(position)
    moves = find_path(current_space, destination)
    p "You made it from #{position} to #{destination} in #{moves.length - 1} moves."
    moves.each {|move| p move}
  end

  def find_space(value)
    @spaces.each do |s|
      return s if s.value == value
    end
    nil
  end

  def find_path(cur, des, path = [], queue = [])
    if cur.neighbors.include? des
      path << cur.value
      path << des
      return path
    end

    path << cur.value

    cur.neighbors.each do |neighbor|
      queue << neighbor
      n = find_space(neighbor)
      if n.neighbors.include? des
        path << n.value
        path << des
        return path
      end
    end
    
    find_path(find_space(queue.shift),des,path,queue)
  end
end