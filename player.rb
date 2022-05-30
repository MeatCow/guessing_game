# Will manage score (lives left) and provide a dead? validator
class Player
  attr_reader :name

  def initialize(name, max_lives = 3)
    @name = name
    @max_lives = max_lives
    @current_lives = max_lives
  end

  def score
    "#{@current_lives}/#{@max_lives}"
  end

  def dead?
    @current_lives <= 0
  end

  def to_s
    "#{name}: #{score}"
  end

  def damage
    @current_lives -= 1
  end
end
