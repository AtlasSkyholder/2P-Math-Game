class Player
  attr_accessor :lives, :active

  def initialize  # starts the players with 3 lives
    @lives = 3
  end

  def lose_life  # if the answer is wrong, removes a life
    @lives -= 1
  end
end