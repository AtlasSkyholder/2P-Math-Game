class Question
  attr_reader :body, :answer

  def initialize
    @first = rand(1..10)
    @second = rand(1..10)
    @answer = @first + @second
    @body = "What is #{@first} + #{@second}?"
  end
end