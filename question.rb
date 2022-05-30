# Provides a math question along with a validator for the answer
class Question
  attr_reader :question

  def initialize(lower_limit, upper_limit)
    @answer = rand(lower_limit..upper_limit)
    difference = rand(1...@answer)
    @question = "What does #{difference} plus #{@answer - difference} equal?"
  end

  def answer?(attempt)
    @answer == attempt
  end
end
