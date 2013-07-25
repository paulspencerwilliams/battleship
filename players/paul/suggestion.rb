class Suggestion 
  attr_accessor :x, :y, :coord

  def initialize (x, y)
    @x = x
    @y = y
    @coord = [x,y]
  end

  def hit?(state)
    state[x][y] == :hit
  end
end


