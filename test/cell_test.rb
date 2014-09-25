require "minitest/autorun"
require "cell"

class CellTest < MiniTest::Unit::TestCase
  def test_cell_is_alive_or_dead
    cell_alive = Cell.new(5,5,1)
    assert_equal 1, cell_alive.state

    cell_dead = Cell.new(3,6,0)
    assert_equal 0, cell_dead.state
  end
end
