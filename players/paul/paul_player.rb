
class PaulPlayer

  def name
    "Paul"
  end

  def new_game
    @memory.forget_previous_game
    [
      [0, 0, 5, :down],
      [4, 4, 4, :across],
      [9, 3, 3, :down],
      [2, 2, 3, :across],
      [9, 7, 2, :down]
    ]
  end

  def take_turn(state, ships_remaining)
  end

end
