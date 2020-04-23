require 'pry'
require_relative 'board'
require_relative 'board_case'
require_relative 'game'
require_relative 'player'
require_relative 'show'

class App

#Iniitalise l'application qui code le déroulement des parties, régit l'affichage, la grille de jeu et la manche (game)
	attr_accessor :game, :screen
	@@over = false
	@@match_win = ""
		
	def initialize
		@board_init = Board.new
		@screen = Show.new(@board_init.all_cases)
		pseudos = self.choose_names
		@game = Game.new(pseudos[0],pseudos[1])
	end

# Affichage du menu d'identification des joueurs
	def choose_names
		@screen.start
		puts "   Tout le monde est prêt?"
		puts ""
		puts "   Qui prend les croix ?"
		puts ""
		print "     >  "
		pseudo1 = gets.chomp
		puts ""
		puts "   Qui prend les ronds ?"
		puts ""
		print "     >  "
		pseudo2 = gets.chomp
		puts ""
		puts ""
		puts "   Ready les p'tits loups ?"
		puts ""
		sleep(1)
		puts "   " +pseudo1 + ", tu commences..."
		sleep(1.5)
		return pseudo1, pseudo2
	end

# Partie en cours
	def match
		while !@game.end && @game.rounds < 10 # Temps que la partie n'est pas gagné ou que tous les tours ne sont pas fini
			@@match_win = @game.status #Lance une manche
		end
		puts ""
		puts "   La partie est terminée."
		sleep (2)
	end

# Demande si l'on joue une nouvelle partie
	def again?
		@screen.start
		puts "   On fait la revanche ? "
		puts ""
		print "   Y / N ?"
		answer = gets.chomp.upcase
		if answer == "Y"    #si oui
			puts ""
			puts "   C'est parti!"
			puts ""
			puts "   Cette fois, on change de tour"
			sleep(1)
			premier = @game.player1.name
			second = @game.player2.name
			@game = Game.new(second,premier)
			puts ""
			puts "   #{second}, tu commences avec les croix."
			@game.player2.name = premier
			sleep(1)
			puts ""
			puts "   #{premier}, tu prends les ronds."
			puts ""
			sleep(1.5)
		else                #si non
			@@over = true
		end
	end

# Prend en compte le résultat de la demande de nouvelle partie
	def continue
		if @@over == true
			return false
		else
			return true
		end
	end

# Renvoie quel joueur à gagné la partie pour le compteur général
	def won?
		return @@match_win
	end

end