require_relative "board"
require_relative "board_analyser"
require_relative "memory"
require_relative "random_coord_strategy"
require_relative "destroy_ship_strategy"
require_relative "ship"

class PaulPlayer

  def name
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
