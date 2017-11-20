class Board

  Space = Struct.new(:number, :owner)

  def initialize
    # @spaces[marker] = owner
    @spaces = []
    number = 1
    3.times do
      @spaces << Array.new(3) { |i| Space.new(number + i, 0) }
      number += 3
    end
  end

  def draw
    @spaces.each do |row|
      row.each do |x|
        case x.owner
        when 0
          print " #{x.number} "
        when 1
          print " X "
        when -1 
          print " O "
        end
      end
      puts
    end
  end

  def mark_space(marker, player)
    return 1 if !(1..9).include(marker)
    @spaces[marker] = player == 1? 1 : -1
  end

  def victory_check
  end

end

