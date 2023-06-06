require_relative 'board'
require_relative 'player'

class TicTacToe
  def initialize
    @board = Board.new
    @player1 = Player.new('X')
    @player2 = Player.new('O')
    @current_player = @player1
  end

  def play
    until @board.game_over?
      display_turn
      puts "Player #{@current_player.symbol}, enter your move (row, col):"
      input = gets.chomp.split.map(&:to_i)
      row, col = input[0], input[1]

      if @board.make_move(row, col, @current_player.symbol)
        if @board.won?(@current_player.symbol)
          display_turn
          puts "Congratulations, player #{@current_player.symbol}! You won!"
          break
        elsif @board.tied?
          display_turn
          puts "The game ended in a draw!"
          break
        else
          switch_player
        end
      else
        puts "Invalid move! Please try again."
      end
    end
  end

  private

  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def display_turn
    puts "\nCurrent board:"
    @board.display
    puts "\n#{@current_player.symbol}'s turn:"
  end
end

game = TicTacToe.new
game.play
