class Board
  Space = Struct.new(:number, :owner)

  def initialize
    # @spaces[marker] = owner
    @spaces = []
    @draw_counter = 0
    number = 1
    3.times do
      @spaces << Array.new(3) { |i| Space.new(number + i, 0) }
      number += 3
    end
  end

  def draw
    print "\n"
    @spaces.each do |row|
      row.each do |x|
        case x.owner
        when 0
          print Rainbow("  #{x.number}  ").silver
        when 1
          print Rainbow('  X  ').red
        when -1
          print Rainbow('  O  ').blue
        end
      end
      print "\n\n"
    end
  end

  def mark_space(marker, player)
    return 1 unless (1..9).cover?(marker) # Validate marker
    row = (marker / 3.1).floor
    column = marker % 3 - 1
    return 2 if @spaces[row][column].owner != 0
    @spaces[row][column].owner = player
    @draw_counter += 1
    return 0
  end

  def check_straights(direction)
    (0..2).each do |axis|
      line = 0
      if direction == :column
        (0..2).each { |x| line += @spaces[x][axis].owner }
      elsif direction == :row
        (0..2).each { |x| line += @spaces[axis][x].owner }
      end
      return [3, -3].include?(line) ? line : 0
    end
  end

  def check_diagonals
    # left-to-right
    line = 0
    (0..2).each do |x|
      line += @spaces[x][x].owner
    end
    # right-to-left
    return line if [3, -3].include?(line)
    line = 0
    2.downto(0).each_with_index do |column, row|
      line += @spaces[row][column].owner
    end
    [3, -3].include?(line) ? line : 0
  end

  def endgame_check
    if [3, -3].include?(check_straights(:column)) ||
       [3, -3].include?(check_straights(:row)) ||
       [3, -3].include?(check_diagonals)
      1
    elsif @draw_counter == 9
      -1
    else
      0
    end
  end

end
