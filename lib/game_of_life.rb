class GameOfLife
  attr_reader :live_cells, :max_x, :max_y

  def initialize(live_positions = [])
    @live_cells = []
    make_live_cells(live_positions) if live_positions != []
  end

  def run
    puts "Welcome to the Game of Life. Enter initial cells seperated by one space (e.g. 'C2 F9 AB5'):"
    initial_cells = $stdin.gets.chomp
    make_live_cells(initial_cells)
  end

  def make_live_cells(positions)
    cell_positions = positions.split(/\ /) #split with non-word character
    cell_positions.each do |cell_position|
      if cell_position != ""
        @live_cells << Cell.new(cell_position,1)
      end
    end
  end

  def grid_size
    @max_x = 0
    @max_y = 0
    @live_cells.each do |cell|
      @max_x = cell.x_pos if cell.x_pos > @max_x
      @max_y = cell.y_pos if cell.y_pos > @max_y
    end
    @max_x += 2
    @max_y += 2
  end
end
