class Player
  attr_accessor :lives, :active

  def initialize
    @lives = 3
  end

  def lose_life
    @lives -= 1
  end
end