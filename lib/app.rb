require 'pry'
require_relative 'board'
require_relative 'board_case'
require_relative 'game'
require_relative 'player'
require_relative 'show'

class App
	attr_accessor :game, :new_display
	@@over = false
		
	def initialize
		pseudos = self.choose_names
		@game = Game.new(pseudos[0],pseudos[1])
		@new_display = Show.new
	end

	def choose_names
		puts "Vous êtes tous les deux prêts?"
		puts "Qui prend les croix ?"
		print "ton p'tit nom >"
		pseudo1 = gets.chomp
		puts ""
		puts "Qui prend les ronds ?"
		print "ton p'tit nom aussi >"
		pseudo2 = gets.chomp
		puts ""
		puts "Ready les p'tits loups ?"
		puts ""
		puts pseudo1 + " commence..."
		return pseudo1, pseudo2
	end

	def match
		while !@game.end && @game.rounds < 10
			@game.status
		end
		puts "La partie est terminée."
	end

	def again?
		puts "On fait la revanche ? "
		print "Y / N ?"
		answer = gets.chomp.upcase
		if answer == "Y"
			puts "C'est parti!"
			puts "On change de tour"
			premier = @game.player1.name
			second = @game.player2.name
			@game = Game.new(second,premier)
			puts "#{second}, tu prends les croix"
			@game.player2.name = premier
			puts "#{premier}, tu prends les ronds"
		else
			@@over = true
		end
	end

	def continue
		if @@over == true
			return false
		else
			return true
		end
	end

end