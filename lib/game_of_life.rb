class GameOfLife

  def initialize
  end

  def run
    puts "Welcome to the Game of Life. Enter initial cells (e.g. C2, F9, etc.):"
    # get_cells(gets.chomp)
  end
  #
  # def get_cells(initial_cells)
  #   initial_cells = initial_cells.split(/\W/) #split with non-word character
  #   initial_cells.each do |cell|
  #     x_pos_char = cells.split(/[0-9]/)
  #     @x_pos = convert_to_num(x_pos_char[0])
  #     @y_pos = cell.delete(x_pos_char[0]).to_i
  #   end
  # end
  #
  # def convert_to_num(alpha)
  #   num = (alpha.ord - 64)+(alpha.length-1)*26
  # end
end
