require "minitest/autorun"
require "game_of_life"

class GameOfLifeTest < MiniTest::Unit::TestCase
  def test_set_cell_positions
    new_game = GameOfLife.new("AA2, D3, BA9")
    test_array = [Cell.new("AA2",1), Cell.new("D3",1), Cell.new("BA9",1)]

    assert_equal test_array, new_game.live_cells
  end
end
