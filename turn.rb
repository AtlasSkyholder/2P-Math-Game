require './question'
require './player'

class Turn
  attr_reader :question

  def initialize
    @question = Question.new  #pass the class Question to the instance @question
    puts "----- NEW TURN -----"
  end

  def ask_question?  #asks the question, then verifies if the answer is right or wrong
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