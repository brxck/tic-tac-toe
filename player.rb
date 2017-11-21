class Player
  attr_reader :number, :name, :value

  def initialize(number, value, name=nil)
    @number = number
    @value = value

    @name = if name.nil?
              "Player #{@number}"
            else
              name
            end
  end
end