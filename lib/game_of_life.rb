class GameOfLife
  attr_reader :live_cells

  def initialize(live_cell_positions = [])
    @live_cells = []
    set_cell_positions(live_cell_positions)
  end

  def run
    puts "Welcome to the Game of Life. Enter initial cells (e.g. 'C2, F9, etc.'):"
    set_cell_positions(gets.chomp)
  end

  def set_cell_positions(positions)
    cell_positions = positions.split(/\, /) #split with non-word character
    cell_positions.each do |cell_position|
      if cell_position != ""
        @live_cells << Cell.new(cell_position,1)
      end
    end
  end
end
