require './question'
require './player'

class Turn
  attr_reader :question

  def initialize
    @question = Question.new
    puts "----- NEW TURN -----"
  end

  def ask_question?
    puts @question.body
    print "> "
    answer = gets.chomp
    if answer.to_i == @question.answer
      return true
    else
      return false
    end
  end
end