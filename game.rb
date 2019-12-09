require './turn'
require './player'
require './question'

class Game
  attr_accessor :active_player

  def initialize
    @player_one = Player.new
    @player_two = Player.new
    @active_player = @player_two
    puts "----- NEW GAME -----"
    while (@player_one.lives > 0 && @player_two.lives > 0) do
      new_turn
    end
    if @player_one.lives == 0
      puts "Player 2, you win!"
    else
      puts "Player 1, you win!"
    end
  end

  def display_score
    puts "Player 1: #{@player_one.lives}/3 --- Player 2: #{@player_two.lives}/3"
  end

  def display_active_player
    if (@active_player == @player_one)
      "Player 1: "
    else
      "Player 2: "
    end
  end

  def switch_active_player
    if (@active_player == @player_one)
      @active_player = @player_two
    else
      @active_player = @player_one
    end
  end

  def new_turn
    switch_active_player
    display_active_player
    turn = Turn.new
    display_score
    if @active_player == @player_one 
      puts "Player 1, you're up!"
    else 
      puts "Player 2, you're up!"
    end
    if turn.ask_question? == false
      puts "Wrong! Try again!"
      @active_player.lose_life
    else
      puts "You got it right!"
    end
    display_score
  end
end

