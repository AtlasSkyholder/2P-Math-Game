require './turn'
require './player'
require './question'

class Game
  attr_accessor :current_player

  def initialize
    @player_one = Player.new
    @player_two = Player.new
    @current_player = @player_two
    puts "----- NEW GAME -----"
    display_score
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

  def display_current_player
    if (@current_player == @player_one)
      "Player 1: "
    else
      "Player 2: "
    end
  end

  def switch_current_player
    if (@current_player == @player_one)
      @current_player = @player_two
    else
      @current_player = @player_one
    end
  end

  def new_turn
    switch_current_player
    display_current_player
    turn = Turn.new

    if @current_player == @player_one 
      puts "Player 1, you're up!"
    else 
      puts "Player 2, you're up!"
    end
    if turn.ask_question? == false
      puts "Wrong answer! Use a calculator next time"
      @current_player.lose_life
    else
      puts "That is the right answer!!"
    end
    display_score
  end
end

