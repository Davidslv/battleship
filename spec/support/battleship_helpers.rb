module BattleshipHelpers
  def assert_equal_board(board, expected)
    expected.each_with_index do |row, y|
      row.each_with_index do |_column, x|
        expect(
          board.get(x, y)
        ).to eql expected[y][x]
      end
    end
  end
end
