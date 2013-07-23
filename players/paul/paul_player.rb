require_relative "strategy"
require_relative "memory"

class PaulPlayer
  def initialize(strategy = Strategy.new, memory = Memory.new)
    @strategy = strategy
    @memory = memory
  end

  def name
    "Paul"
  end

  def new_game
    [
      [0, 0, 5, :down],
      [4, 4, 4, :across],
      [9, 3, 3, :down],
      [2, 2, 3, :across],
      [9, 7, 2, :down]
    ]
  end

  def take_turn(state, ships_remaining)
    suggestion = @strategy.suggest_next(@memory.last_coord, state)
    @memory.remember_turn(suggestion)
    suggestion
  end

end

