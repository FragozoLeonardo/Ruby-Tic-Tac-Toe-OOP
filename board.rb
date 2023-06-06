class Board
  def initialize
    @board = Array.new(3) { Array.new(3) }
  end

  def display
    @board.each do |row|
      puts row.map { |cell| cell.nil? ? '_' : cell }.join(' ')
    end
  end

  def make_move(row, col, symbol)
    if valid_move?(row, col)
      @board[row][col] = symbol
      true
    else
      false
    end
  end

  def game_over?
    won?('X') || won?('O') || tied?
  end

  def won?(symbol)
    (0..2).any? { |i| row_won?(i, symbol) } ||
      (0..2).any? { |i| col_won?(i, symbol) } ||
      diagonal_won?(symbol)
  end

  def tied?
    @board.flatten.none?(&:nil?)
  end

  private

  def valid_move?(row, col)
    (0..2).include?(row) && (0..2).include?(col) && @board[row][col].nil?
  end

  def row_won?(row, symbol)
    @board[row].all? { |cell| cell == symbol }
  end

  def col_won?(col, symbol)
    @board.all? { |row| row[col] == symbol }
  end

  def diagonal_won?(symbol)
    (0..2).all? { |i| @board[i][i] == symbol } ||
      (0..2).all? { |i| @board[i][2 - i] == symbol }
  end
end
