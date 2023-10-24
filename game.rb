class Game
  def initialize(player1, player2)
    @players = [player1, player2]
    @current_player = 0
  end

  def run
    puts "----- NEW GAME -----"
    while @players.all? { |player| player.lives > 0 }
      puts "----- NEW TURN -----"
      current_question = Question.new
      puts "Player #{@current_player + 1}: #{current_question}"

      player_answer = gets.chomp.to_i
      if current_question.correct?(player_answer)
        puts "Player #{@current_player + 1}: YES! You are correct."
      else
        puts "Player #{@current_player + 1}: Seriously? No!"
        @players[@current_player].lose_life
      end

      puts "P1: #{@players[0].lives}/3 vs P2: #{@players[1].lives}/3"
      switch_player
    end

    winner = @players.find { |player| player.lives > 0 }
    loser = @players.find { |player| player != winner }
    puts "#{winner == @players[0] ? 'Player 1' : 'Player 2'} wins with a score of #{winner.lives}/3"
    puts "----- GAME OVER -----"
    puts "Goodbye!"
  end

  private

  def switch_player
    @current_player = 1 - @current_player
  end
end
