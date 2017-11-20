class Board

  def initialize
    # @spaces[marker] = owner
    @spaces = {}
    (1..9).each do |i|
      @spaces[i] = 0
    end
  end

  def draw
    @spaces.each do |space|
      if space[1] == 0
        print " #{space[0]} "
      else
        print space[1] == 1 ? " X " : " O "
      end
      print "\n" if space[0] % 3 == 0
    end
  end

  def mark_space(marker, player)
    return 1 if !(1..9).include(marker)
    @spaces[marker] = player == 1? 1 : -1
  end

  private

end
    