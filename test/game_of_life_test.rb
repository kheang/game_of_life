require "minitest/autorun"
require "game_of_life"

class GameOfLifeTest < MiniTest::Unit::TestCase
  def test_set_cell_positions
    new_game = GameOfLife.new("AA2, D3, BA9")
    test_array = [Cell.new("AA2",1), Cell.new("D3",1), Cell.new("BA9",1)]

    assert_equal test_array, new_game.live_cells
  end

  def test_size_grid
    new_game = GameOfLife.new("Z3, D30")
    new_game.size_grid

    assert_equal 28, new_game.max_x
    assert_equal 32, new_game.max_y
  end

  def test_build_grid
    new_game = GameOfLife.new("D5, A10")
    new_game.build_grid
    grid = Array.new(6,Array.new(12))
    assert_equal grid, new_game.grid
  end
end
