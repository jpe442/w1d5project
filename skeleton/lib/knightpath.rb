class KnightPathFinder

  def self.valid_moves(pos)
    valid_pos = []

    row = pos[0]
    col = pos[1]

    knight_map = {1 => [2,-2], 2 => [1, -1], -1 => [2,-2], -2 => [1,-1]}

    knight_map.each do |k,v|
      v.each |v|
        valid_pos << [row + k, col + v]
      end
    end


    valid_pos
  end

  def initialize(starting_pos)

  end

end
