require 'pry'
require 'bundler'
Bundler.require
require_relative 'lib/app'
require_relative 'lib/game'
require_relative 'lib/show'

# Initialisation des compteurs
overall_rounds = 0
overall_win = []

# Lancement de l'application de jeu
tic_tac_toe = App.new

while tic_tac_toe.continue do # Temps que les joueurs veulent jouer ou sont en cours de partie
	tic_tac_toe.match # Partie en cours
	tic_tac_toe.again? # Jouer un autre tour
	overall_win << tic_tac_toe.won? # Compteur de victoires
	overall_rounds += 1
end

puts ""

puts "Nombre total de parties : #{overall_rounds}." 

puts ""

first_player = overall_win.count(tic_tac_toe.game.player1.name)
second_player = overall_win.count(tic_tac_toe.game.player2.name)
if first_player > second_player
	puts "Victoire total de " + tic_tac_toe.game.player1.name + " avec #{first_player} parties gagnées contre #{second_player} pour " + tic_tac_toe.game.player2.name + "."
elsif second_player > first_player
	puts "Victoire total de " + tic_tac_toe.game.player2.name + " avec #{second_player} parties gagnées contre #{first_player} pour " + tic_tac_toe.game.player1.name + "."
else
	puts "Egalité, #{first_player} parties remportées chacun."
end
puts ""
puts ""


