class Cell
  attr_reader :x_pos, :y_pos, :state

  def initialize(x_pos,y_pos,state)
    @x_pos = x_pos
    @y_pos = y_pos
    @state = state
  end

  def <=>(other_cell)
    @state <=> other_cell.state
  end

  def run
  end
end
