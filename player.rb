class Player
  attr_reader :number, :name, :value
  attr_accessor :score

  def initialize(number, value, name=nil)
    @number = number
    @value = value
    @score = 0
    @name = if name.nil?
              "Player #{@number}"
            else
              name
            end
  end
end