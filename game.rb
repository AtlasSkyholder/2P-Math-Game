require './turn'
require './player'
require './question'

class Game
  attr_accessor :current_player

  def initialize  #starts the game
    @player_one = Player.new  #creates a player_one with Player class
    @player_two = Player.new  #creates a player_Two with Player class
    @current_player = @player_two
    puts "----- NEW GAME -----"
    display_score   #displays the full score
    while (@player_one.lives > 0 && @player_two.lives > 0) do  #This loop will run while lives is above 0
      new_turn
    end
    if @player_one.lives == 0
      puts "Player 2, you win!"
    else
      puts "Player 1, you win!"
    end
  end

  def display_score  # definition for displaying lives
    puts "Player 1: #{@player_one.lives}/3 --- Player 2: #{@player_two.lives}/3"
  end

  def display_current_player  #displays the current player
    if (@current_player == @player_one)
      "Player 1: "
    else
      "Player 2: "
    end
  end

  def switch_current_player  # switches the player
    if (@current_player == @player_one)
      @current_player = @player_two
    else
      @current_player = @player_one
    end
  end

  def new_turn  # builds the new turn
    switch_current_player
    display_current_player
    turn = Turn.new

    if @current_player == @player_one 
      puts "Player 1, you're up!"
    else 
      puts "Player 2, you're up!"
    end
    if turn.ask_question? == false  #if the answer is wrong or right
      puts "Wrong answer! Use a calculator next time"
      @current_player.lose_life
    else
      puts "That is the right answer!!"
    end
    display_score
  end
end

