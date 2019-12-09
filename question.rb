class Question
  attr_reader :body, :answer

  def initialize  # generates the questions with numbers from 1 to 20, then produces an answer
    @number_one = rand(1..20)
    @number_two = rand(1..20)
    @answer = @number_one + @number_two
    @body = "What does #{@number_one} plus #{@number_two} equal?"
  end
end