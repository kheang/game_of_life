class GameOfLife
  attr_reader :live_cells, :live_cells_next_gen, :max_x, :max_y, :grid, :grid_next_gen

  def initialize(initial_positions = [])
    @live_cells = []
    @live_cells_next_gen = []
    if initial_positions != []
      make_live_cells(initial_positions)
    end
  end

  def run
    puts "Welcome to the Game of Life. Enter initial cells seperated by one space (e.g. 'C2 F9 AB5'):"
    input = $stdin.gets.chomp
    make_live_cells(input)

    gen = 0

    until @live_cells == []
      gen += 1
      size_grid
      build_grid
      populate_grid
      print_grid(gen)
      check_live_cells
      check_dead_cells
      @grid = @grid_next_gen
      @grid_next_gen = []
      @live_cells = @live_cells_next_gen
      @live_cells_next_gen = []
    end
  end

  def print_grid(gen)
    system('clear')
    puts "Generation: #{gen}\n"
    y = 0
    until y > @grid[0].length
      @grid.each do |row|
        if row[y] == 1
          print "x"
        else
          print "."
        end
      end
      print "\n"
      y += 1
    end
    $stdout.flush
    sleep(1)
  end

  def make_live_cells(positions_str)
    positions_arr = positions_str.split(/\ /)
    positions_arr.each do |cell_position|
      @live_cells << get_x_y(cell_position)
    end
  end

  def get_x_y(position)
    x_y = position.split(/[0-9]/)
    x_pos = get_x(x_y[0])
    y_pos = position.delete(x_y[0]).to_i
    positions_array = [x_pos,y_pos]
  end

  def get_x(x_alpha)
    x_alpha = (x_alpha.to_s).scan(/\w/)
    x_alpha_len = x_alpha.length
    x_pos_nums = x_alpha.map { |letter| letter.upcase.ord - 64 }
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
    @max_x += 4
    @max_y += 4
  end

  def build_grid
    @grid = Array.new(@max_x) {Array.new(@max_y,0)}
    @grid_next_gen = Array.new(@max_x) {Array.new(@max_y,0)}
  end

  def populate_grid
    @live_cells.each do |live_cell|
      @grid[live_cell[0]][live_cell[1]] = 1
    end
  end

  def check_live_cells
    @live_cells.each do |live_cell|
      x = live_cell[0]
      y = live_cell[1]
      live_neighbors = get_neighbor_count(x,y)
      if live_neighbors == 2 || live_neighbors == 3
        @grid_next_gen[x][y] = 1
        @live_cells_next_gen << [x,y]
      end
    end
  end

  def get_neighbors(x,y)
    neighbors = [[x - 1,y - 1],[x - 1,y],[x - 1,y + 1],[x,y - 1],[x,y + 1],[x + 1, y - 1],[x + 1, y],[x + 1, y + 1]]
  end

  def get_neighbor_count(x,y)
    live_neighbors = 0
    neighbors = get_neighbors(x,y)

    neighbors.each do |neighbor|
      live_neighbors += @grid[neighbor[0]][neighbor[1]]
    end
    live_neighbors
  end

  def check_dead_cells
    neighbors_list = []
    @live_cells.each do |live_cell|
      neighbors = get_neighbors(live_cell[0],live_cell[1])
      neighbors_list = neighbors_list | neighbors
    end

    neighbors_list.each do |neighbor|
      count = get_neighbor_count(neighbor[0],neighbor[1])
      if count == 3
        @grid_next_gen[neighbor[0]][neighbor[1]] = 1
        @live_cells_next_gen << [neighbor[0],neighbor[1]]
      end
    end
  end

end

game = GameOfLife.new
game.run
