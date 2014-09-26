class Cell
  attr_reader :x_pos, :y_pos, :state

  def initialize(position,state)
    @state = state
    @x_pos = 0
    @y_pos = 0
    calc_position(position)
  end

  def calc_position(position)
    x_pos_alpha = position.split(/[0-9]/)
    get_x(x_pos_alpha[0])
    @y_pos = position.delete(x_pos_alpha[0]).to_i
  end

  def get_x(x_pos_alpha)
    x_pos_alpha = x_pos_alpha.scan(/\w/)
    x_pos_alpha_len = x_pos_alpha.length
    x_pos_alpha = x_pos_alpha.map.with_index { |letter,index| (letter.ord - 64)*26**(x_pos_alpha_len-(index+1)) }
    @x_pos = x_pos_alpha.inject { |sum, value| sum + value }
  end

end
