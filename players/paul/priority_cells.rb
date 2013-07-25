class PriorityCells

  def initialize(stack = Array.new)
    @stack = stack
  end

  def add_hit(coord, state)
    add_coord_to_stack(coord.x, coord.y - 1, state)
    add_coord_to_stack(coord.x + 1, coord.y, state)
    add_coord_to_stack(coord.x, coord.y + 1, state)
    add_coord_to_stack(coord.x - 1, coord.y, state)
  end

  def add_coord_to_stack(x,y, state)
    if x >= 0 && x <= 9 && y >= 0 && y <= 9 
      if state[x][y] == :unknown
        @stack.push([x, y])
      end
    end
  end

  def suggest_next
    coord =  @stack.pop
    if coord.nil?
      nil
    else
      Suggestion.new(coord[0],coord[1])
    end
  end

  private :add_coord_to_stack

end

