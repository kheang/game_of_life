# class Cell
#   attr_reader :x_pos, :y_pos, :state
#
#   def initialize(position)
#     @x_pos = 0
#     @y_pos = 0
#     calc_position(position)
#   end
#
#   def calc_position(position)
#     x_pos_alpha = position.split(/[0-9]/)
#     @x_pos = get_x(x_pos_alpha[0])
#     @y_pos = position.delete(x_pos_alpha[0]).to_i
#   end
#
#   def get_x(x_pos_alpha)
#     x_pos_alpha = (x_pos_alpha.to_s).scan(/\w/)
#     x_pos_alpha_len = x_pos_alpha.length
#     x_pos_nums = x_pos_alpha.map { |letter| letter.ord - 64 }
#     x_pos_alpha = x_pos_nums.map.with_index { |num_value,index| num_value*26**(x_pos_alpha_len-(index+1)) }
#     x_pos_alpha.inject { |sum, value| sum + value }
#   end
#
#   def ==(other_cell)
#     if @state == other_cell.state && @x_pos == other_cell.x_pos && @y_pos == other_cell.y_pos
#       true
#     else
#       false
#     end
#   end
# end
