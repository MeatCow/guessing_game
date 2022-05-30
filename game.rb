require './turn'
require './player'

# Will provide all I/O for the game's operation, as well as the game loop
class Game
  def initialize
    @players = []
    @player1 = Player.new 'Matt'
    @player2 = Player.new 'Jon'
    @players << @player1
    @players << @player2

    @current_turn = Turn.new(@player1, @player2)
    puts "Welcome #{@player1.name} & #{@player2.name}!"
  end

  def start
    while @players.none?(&:dead?)
      play_turn
      display_lives
      next_turn
    end
    game_over
  end

  private

  def play_turn
    player = @current_turn.current_player
    question = @current_turn.question
    if query?(player, question)
      puts "#{player.name}: YES! You are correct."
    else
      puts "#{player.name}: Seriously? No!"
      player.damage
    end
  end

  def query?(player, question)
    puts "#{player.name}: #{question.text}"
    print '> '
    answer = gets.chomp.to_i
    question.answer? answer
  end

  def display_lives
    puts @players.join(' vs. ')
  end

  def next_turn
    puts '----- NEW TURN -----'
    @current_turn.next
  end

  def game_over
    winner = @players.find { |p| !p.dead? }
    puts "#{winner.name} wins with a score of #{winner.score}"
    puts '----- GAME OVER -----'
    puts 'Good bye!'
  end
end
