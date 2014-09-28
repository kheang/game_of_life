class GameOfLife
  attr_reader :live_cells, :max_x, :max_y, :grid

  def initialize(initial_positions)
    @live_cells = []
    make_live_cells(initial_positions)
  end

  def run
    puts "Welcome to the Game of Life. Enter initial cells seperated by one space (e.g. 'C2 F9 AB5'):"
    input = $stdin.gets.chomp
    make_live_cells(input)
  end

  def make_live_cells(positions_str)
    positions_arr = positions_str.split(/\ /)
    positions_arr.each do |cell_position|
      if cell_position != ""
        @live_cells << get_x_y(cell_position)
      end
    end
  end

  def get_x_y(position)
    x_y = position.split(/[0-9]/)
    x_pos = get_x(x_y[0])
    y_pos = position.delete(x_y[0]).to_i
    positions_array = []
    positions_array[0] = x_pos
    positions_array[1] = y_pos
    positions_array
  end

  def get_x(x_alpha)
    x_alpha = (x_alpha.to_s).scan(/\w/)
    x_alpha_len = x_alpha.length
    x_pos_nums = x_alpha.map { |letter| letter.ord - 64 }
    x_pos_nums = x_pos_nums.map.with_index { |num_value,index| num_value*26**(x_alpha_len-(index+1)) }
    x_pos_nums.inject { |sum, value| sum + value }
  end

  def size_grid
    @max_x = 0
    @max_y = 0
    @live_cells.each do |cell|
      @max_x = cell[0] if cell[0] > @max_x
      @max_y = cell[1] if cell[1] > @max_y
    end
    @max_x += 2
    @max_y += 2
  end

  def build_grid
    @grid = Array.new(@max_x) {Array.new(@max_y,0)}
  end

  def populate_grid
    @live_cells.each do |live_cell|
      @grid[live_cell[0]][live_cell[1]] = 1
    end
  end

  def check_live_cells
    @current_grid = @grid
    @live_cells.each do |live_cell|
      live_neighbors = 0
      x = live_cell[0]
      y = live_cell[1]
      live_neighbors += @current_grid[x - 1][y - 1]
      live_neighbors += @current_grid[x - 1][y]
      live_neighbors += @current_grid[x - 1][y + 1]
      live_neighbors += @current_grid[x][y - 1]
      live_neighbors += @current_grid[x][y + 1]
      live_neighbors += @current_grid[x + 1][y - 1]
      live_neighbors += @current_grid[x + 1][y]
      live_neighbors += @current_grid[x + 1][y + 1]
      if live_neighbors < 2 || live_neighbors > 3
        @grid[x][y] = 0
      end
    end
  end
end
