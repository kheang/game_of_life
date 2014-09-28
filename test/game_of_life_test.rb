require "minitest/autorun"
require "game_of_life"

class GameOfLifeTest < MiniTest::Unit::TestCase
  def test_set_cell_positions
    new_game = GameOfLife.new("AA2 D3 BA9")
    test_array = [[27,2], [4,3], [53,9]]

    assert_equal test_array, new_game.live_cells
  end

  def test_size_grid
    new_game = GameOfLife.new("Z3 D30")
    new_game.size_grid

    assert_equal 28, new_game.max_x
    assert_equal 32, new_game.max_y
  end

  def test_build_grid
    new_game = GameOfLife.new("D5, A10")
    new_game.size_grid
    grid = Array.new(6,Array.new(12,0))

    assert_equal grid, new_game.build_grid
  end

  def test_populate_grid
    new_game = GameOfLife.new("C3")
    new_game.size_grid
    new_game.build_grid
    new_game.populate_grid
    grid = Array.new(5) {Array.new(5,0)}
    grid[3][3] = 1
    
    assert_equal grid, new_game.grid
  end

  def test_check_live_cells
    new_game = GameOfLife.new("C3")
    new_game.size_grid
    new_game.build_grid
    new_game.populate_grid
    new_game.check_live_cells
    grid = Array.new(5) {Array.new(5,0)}

    assert_equal grid, new_game.grid
  end

end
