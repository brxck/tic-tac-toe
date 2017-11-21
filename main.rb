# require 'rainbow'

require_relative "player"
require_relative "board"

class Game
  def initialize
    @turn = true
    @board = Board.new
    @player1 = Player.new(1, 1)
    @player2 = Player.new(2, -1)
    @board.draw
    play
  end

  def take_turn(player)
    puts "#{player.name}, pick a square: "
    loop do
      marker = gets.chomp.to_i
      result = @board.mark_space(marker, player.value)
      break if result.zero?
      puts "Invalid square." if result == 1
      puts "Square already taken." if result == 2
    end
  end

  def round
    @turn ? take_turn(@player1) : take_turn(@player2)
    @turn = !@turn
    @board.draw
    endgame_check
  end

  def endgame_check
    if @board.endgame_check == 1
      puts @turn ? "#{@player1.name} wins!" : "#{@player2.name} wins!"
    elsif @board.endgame_check == -1
      puts "It's a draw!"
    end
    # TODO: restart game
  end

  def play
    round while @board.endgame_check.zero?
    end_game
  end

end

game = Game.new
