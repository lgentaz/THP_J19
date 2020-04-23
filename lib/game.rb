require 'pry'
require_relative 'board'
require_relative 'board_case'
require_relative 'player'

class Game

# Initialise la manche du jeu en créant différents joueurs, régit l'affichage et la grille de jeu
	attr_accessor :player1, :player2, :board, :rounds
# Remet les compteurs à zéro lors d'une nouvelle partie
	@@valid = false
	@@empty = false
	@@ended = false

	def initialize(pseudo1,pseudo2)
		@player1 = Player.new(pseudo1,"x")
		@player2 = Player.new(pseudo2,"o")
		@board = Board.new
		@rounds = 1
		@@valid = false
		@@empty = false
		@@ended = false
		@@screen = Show.new(@board.all_cases)
	end
	
	def status
		@@screen = Show.new(@board.all_cases)
		@@screen.play
		if @rounds == 10
			@@ended = true
			puts ""
			self.end
			return "0"
		elsif @rounds.odd? && @rounds < 10
			puts ""
			puts "   A ton tour #{@player1.name}"
			play = self.turn(@player1)
			if play == "won"
				return @player1.name
			end
		elsif @rounds.even? && @rounds < 10
			puts ""
			puts "   A ton tour #{@player2.name}"
			play = self.turn(@player2)
			if play == "won"
				return @player1.name
			end
		end

	end

	def turn(player)
		puts ""
		puts "   Choisis une case"
		puts ""
		print "     > "
		played = gets.chomp.upcase
		puts ""
		while !is_valid?(played) || !is_empty?(played) do
			puts "   Entres un autre choix"
			puts ""
			print "   > "
			played = gets.chomp.upcase
			puts ""
		end
		@@valid = false
		@@empty = false
		@board.all_cases.each do |i|
			if i.position == played
				i.symbol = player.symbol
			end
		end
		@rounds += 1
		if self.win?
			@@screen.play
			puts "   Bravo #{player.name}, tu as remporté la partie !!!"
			@@ended = true
			return "won"
		end


	end

	def is_valid?(choice)
		@board.all_cases.each do |i|
			if choice == i.position
				@@valid = true
			end
		end
		if @@valid == false
			puts "   Coordonnée non trouvée."
			puts ""
		else
			return @@valid
		end
	end

	def is_empty?(choice)
		@board.all_cases.each do |i|
			if choice == i.position
				if i.symbol == " "
					@@empty = true
				end
			end
		end
		if @@empty == false
			puts "   Case déjà prise."
			puts ""
		else
			return @@empty
		end
	end

	def win?
		if @board.a1.symbol == @board.a2.symbol && @board.a1.symbol == @board.a3.symbol && @board.a1.symbol != " "
			return true
		elsif @board.b1.symbol == @board.b2.symbol && @board.b1.symbol == @board.b3.symbol && @board.b1.symbol != " "
			return true
		elsif @board.c1.symbol == @board.c2.symbol && @board.c1.symbol == @board.c3.symbol && @board.c1.symbol != " "
			return true
		elsif @board.a1.symbol == @board.b1.symbol && @board.a1.symbol == @board.c1.symbol && @board.a1.symbol != " "
			return true
		elsif @board.b2.symbol == @board.a2.symbol && @board.b2.symbol == @board.c2.symbol && @board.a2.symbol != " "
			return true
		elsif @board.b3.symbol == @board.c3.symbol && @board.b3.symbol == @board.a3.symbol && @board.a3.symbol != " "
			return true
		elsif @board.a1.symbol == @board.b2.symbol && @board.a1.symbol == @board.c3.symbol && @board.a1.symbol != " "
			return true
		elsif @board.c1.symbol == @board.b2.symbol && @board.b2.symbol == @board.a3.symbol && @board.c1.symbol != " "
			return true
		else
			return false
		end
	end


	def end
		if @@ended
			return true
		end
	end

end