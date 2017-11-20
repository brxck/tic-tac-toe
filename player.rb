class Player
  attr_reader :number

  def initialize(number, name=nil)
    @number = number

    if name.nil?
      @name = "Player #{@number}"
    else 
      @name = name
    end
  end

  private

  def take_turn
    puts "Pick a square: "
    loop do
      number = gets.chomp
      result = board.mark_space(marker, @number)
      break if result == 0
      puts "Invalid square." if result == 1 
      puts "Square already taken." if result == 2
    end
  end
end