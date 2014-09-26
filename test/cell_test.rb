require "minitest/autorun"
require "cell"

class CellTest < MiniTest::Unit::TestCase
  def test_cell_is_alive_and_position
    cell = Cell.new("C5",1)
    assert_equal 1, cell.state
    assert_equal 3, cell.x_pos
    assert_equal 5, cell.y_pos

    cell = Cell.new("BB23",1)
    assert_equal 1, cell.state
    assert_equal 54, cell.x_pos
    assert_equal 23, cell.y_pos
  end
end
