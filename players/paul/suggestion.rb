class Suggestion 
  attr_accessor :x, :y, :coord

  def initialize (x, y)
    @x = x
    @y = y
    @coord = [x,y]
  end

  def hit?(state)
    state[y][x] == :hit
  end
end


