require './player'
require './question'
require './game'

player1 = Player.new
player2 = Player.new

game = Game.new(player1, player2)
game.run
