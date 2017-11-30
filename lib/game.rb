require_relative "player"
require_relative "board"
require "rainbow"

class Game
  def initialize
    @starting_turn = true
    @turn = @starting_turn
    @board = Board.new
    create_players
    @board.draw
    play
  end

  def reset
    @starting_turn = !@starting_turn
    @turn = @starting_turn
    @board = Board.new
    @board.draw
    play
  end

  def create_players
    print "Player 1's name:"
    name1 = gets.chomp
    @player1 = name1 != "" ? Player.new(1, 1, name1) : Player.new(1, 1)

    print "Player 2's name:"
    name2 = gets.chomp
    @player2 = name2 != "" ? Player.new(2, -1, name2) : Player.new(2, -1)
  end

  def play
    round while @board.endgame_check.zero?
    end_game
    show_scores
    reset
  end

  def round
    @turn ? take_turn(@player1) : take_turn(@player2)
    @turn = !@turn
    @board.draw
  end

  def take_turn(player)
    print "#{player.name}, pick a square: "
    loop do
      marker = gets.chomp.to_i
      result = @board.mark_space(marker, player.value)
      break if result.zero?
      print "Invalid square. Try again: " if result == 1
      print "Square already taken. Try again: " if result == 2
    end
  end

  def end_game
    if @board.endgame_check == 1
      winner = @turn ? @player1 : @player2
      print Rainbow("#{winner.name} wins!\n\n").green
      winner.score += 1
    elsif @board.endgame_check == -1
      puts Rainbow("It's a draw!").green
    end
  end

  def show_scores
    puts Rainbow("#{@player1.name}: #{@player1.score} | #{@player2.name}: #{@player2.score}").cyan
  end
end
