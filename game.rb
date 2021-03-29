require('./players')
require('./question')

class Game

  def initialize
    @players = [
      Players.new('Player 1'),
      Players.new('Player 2')
    ]
    # If turn is false it is player 1's turn
    @turn = false
  end

  def play
    # if both players are not dead game is not over:
    while (!game_over?)
      header "NEW TURN"
      if (@turn)
        question(@players[0])
      else
        question(@players[1])
      end
      header "STATS"
      puts status
      
      # Switch turn of player
      if (@turn)
        @turn = false
      else
        @turn = true
      end

    end

    header "GAME OVER"
    puts "#{detWinner.name} wins with a score of #{detWinner.points}/3!"

  end

end

private

def detWinner
  if (@players[0].points > @players[1].points)
    return @players[0]
  else
    return @players[1]
  end
end

def status
  "P1: #{@players[0].points}/3 vs P2: #{@players[1].points}/3"
end

def question player
  question = Question.new
  puts "#{player.name}: #{question.ask}?"
  @answer = $stdin.gets.chomp
  if (@answer.to_i === question.answer)
    puts "That's right!"
  else
    puts "That's wrong! The correct answer is #{question.answer}, you said #{@answer}"
    player.red_points
  end
end

def game_over?
  @players.any? { |player| player.dead? }
end

def header content
  puts
  print "===========  "
  print content
  print "  ==========="
  puts
end