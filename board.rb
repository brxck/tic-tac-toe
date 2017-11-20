
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
          print ' X '
        when -1
          print ' O '
        end
      end
      puts
    end
  end

  def mark_space(marker, player)
    return 1 unless (1..9).include?(marker) # Validate marker
    row = (marker / 3.1).floor
    column = marker % 3 - 1
    
    return 2 if @spaces[row][column].owner != 0
    @spaces[row][column].owner = player
  end

  def check_straights(direction)
    (0..2).each do |axis|
      line = 0
      if direction == "column"
        (0..2).each { |x| line += @spaces[x][axis].owner }
      elsif direction == "row"
        (0..2).each { |x| line += @spaces[axis][x].owner }
      end
      return line == 3 || line == -3 ? line : 0
  end

  def check_diagonals
  end

  def victory_check

  end
  
end
