require "minitest/autorun"
require "game_of_life"

class GameOfLifeTest < MiniTest::Unit::TestCase
  def test_set_cell_positions
    new_game = GameOfLife.new("AA2, D3, BA9")
    test_array = [Cell.new("AA2",1), Cell.new("D3",1), Cell.new("BA9",1)]

    assert_equal test_array, new_game.live_cells
  end

  def test_build_grid
    new_game = GameOfLife.new("Z3, D30")
    new_game.grid_size

    assert_equal 28, new_game.max_x
    assert_equal 32, new_game.max_y
  end
end
