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

    assert_equal 30, new_game.max_x
    assert_equal 34, new_game.max_y
  end

  def test_build_grid
    new_game = GameOfLife.new("D5, A10")
    new_game.size_grid
    grid = Array.new(8,Array.new(14,0))

    assert_equal grid, new_game.build_grid
  end

  def test_populate_grid
    new_game = GameOfLife.new("C3")
    new_game.size_grid
    new_game.build_grid
    new_game.populate_grid
    grid = Array.new(7) {Array.new(7,0)}
    grid[3][3] = 1

    assert_equal grid, new_game.grid
  end

  def test_get_surrounding_neighbors
    new_game = GameOfLife.new("C3")
    new_game_neighbors = new_game.get_neighbors(3,3)
    neighbors = [[2,2],[2,3],[2,4],[3,2],[3,4],[4,2],[4,3],[4,4]]
    assert_equal neighbors, new_game_neighbors
  end

  def test_get_live_neighbor_count
    new_game = GameOfLife.new("C3 C4 C5")
    new_game.size_grid
    new_game.build_grid
    new_game.populate_grid
    neighbor_count = new_game.get_neighbor_count(new_game.grid,4,4)

    assert_equal 3, neighbor_count
  end

  def test_check_live_cells
    new_game = GameOfLife.new("C1 C2 C3 C4")
    new_game.size_grid
    new_game.build_grid
    new_game.populate_grid
    new_game.check_live_cells
    grid = Array.new(7) {Array.new(8,0)}
    grid[3][2] = 1
    grid[3][3] = 1

    assert_equal grid, new_game.grid_next_gen
    assert_equal [[3,2],[3,3]], new_game.live_cells_next_gen
  end

  def test_check_dead_cells
    new_game = GameOfLife.new("C1 C2 C3")
    new_game.size_grid
    new_game.build_grid
    new_game.populate_grid
    new_game.check_live_cells
    new_game.check_dead_cells
    grid = Array.new(7) {Array.new(7,0)}
    grid[2][2] = 1
    grid[4][2] = 1
    grid[3][2] = 1

    assert_equal grid, new_game.grid_next_gen
  end

end
