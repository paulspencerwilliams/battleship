class Strategy

  def initialize(priority_cells=PriorityCells.new, randomizer=Randomizer.new)
    @randomizer = randomizer
    @priority_cells = priority_cells
  end

  def suggest_next(last_turn, state)
    unless last_turn.nil?
      if last_turn.hit?(state) 
        @priority_cells.add_hit(last_turn, state) 
      end
    end

    suggestion =  @priority_cells.suggest_next(state)
    if suggestion.nil?
      @randomizer.suggest_next(state)
    else
      suggestion
    end
  end


end
