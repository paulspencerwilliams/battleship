class Randomizer
  def suggest_next(state)
    x = rand(10) 
    y = rand(10)
    if state[x][y] == :unknown
      [x,y]
    else
      suggest_next(state)
    end 

  end
end
