class Strategy

  def initialize(priority_cells=PriorityCells.new, randomizer=Randomizer.new)
    @randomizer = randomizer
    @priority_cells = priority_cells  end

  def suggest_next(last_turn, state)
    if last_turn.hit? then @priority_cells.add_hit(last_turn, state) end

    if @priority_cells.suggestions?
      @priority_cells.suggest_next(state)
    else
      @randomizer.suggest_next(state)
    end
  end


end
