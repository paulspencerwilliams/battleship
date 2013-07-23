class PaulPlayer
  def initialize(strategy = Strategy.new, last_turn = LastTurn.new)
    @strategy = strategy
    @last_turn = last_turn
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
    suggestion = @strategy.suggest_next(@last_turn, state)
    @last_turn.remember_turn(suggestion)
    suggestion
  end

end
