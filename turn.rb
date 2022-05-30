require './question'
# Will manage the question being asked, as well as who the current player is
class Turn
  attr_reader :question

  def initialize(player1, player2)
    @players = []
    @players << player1
    @players << player2
    @current_player = player1
    @question = Question.new
  end

  def next
    @current_player = @players.rotate![0]
    @question = Question.new
  end
end
