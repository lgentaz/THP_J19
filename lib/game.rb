require 'pry'
require_relative 'board'
require_relative 'board_case'
require_relative 'player'

class Game

	attr_accessor :player1, :player2, :board, :rounds
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
	end
	
	def status
		if @rounds == 10
			@@ended = true
			self.end
		elsif @rounds.odd? && @rounds < 10
			puts "#{@player1.name}, à ton tour..."
			self.turn(@player1)
		elsif @rounds.even? && @rounds < 10
			"#{@player2.name} , à ton tour..."
			self.turn(@player2)
		end
	end

	def turn(player)
		puts "Choisis une case #{player.name}"
		print "> "
		played = gets.chomp.upcase
		while !is_valid?(played) || !is_empty?(played) do
			puts "Entres un autre choix"
			print "> "
			played = gets.chomp.upcase
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
			puts "Bravo #{player.name}, tu as remporté la partie !!!"
			@@ended = true
		end

	end

	def is_valid?(choice)
		@board.all_cases.each do |i|
			if choice == i.position
				@@valid = true
			end
		end
		if @@valid == false
			puts "Coordonnée non trouvée."
		else
			return @@valid
		end
	end

	def is_empty?(choice)
		@board.all_cases.each do |i|
			if choice == i.position
				if i.symbol == ""
					@@empty = true
				end
			end
		end
		if @@empty == false
			puts "Case déjà prise."
		else
			return @@empty
		end
	end

	def win?
		if @board.a1.symbol == @board.a2.symbol && @board.a1.symbol == @board.a3.symbol && @board.a1.symbol != ""
			return true
		elsif @board.b1.symbol == @board.b2.symbol && @board.b1.symbol == @board.b3.symbol && @board.b1.symbol != ""
			return true
		elsif @board.c1.symbol == @board.c2.symbol && @board.c1.symbol == @board.c3.symbol && @board.c1.symbol != ""
			return true
		elsif @board.a1.symbol == @board.b1.symbol && @board.a1.symbol == @board.c1.symbol && @board.a1.symbol != ""
			return true
		elsif @board.b2.symbol == @board.a2.symbol && @board.b2.symbol == @board.c2.symbol && @board.a2.symbol != ""
			return true
		elsif @board.b3.symbol == @board.c3.symbol && @board.b3.symbol == @board.a3.symbol && @board.a3.symbol != ""
			return true
		elsif @board.a1.symbol == @board.b2.symbol && @board.a1.symbol == @board.c3.symbol && @board.a1.symbol != ""
			return true
		elsif @board.c1.symbol == @board.b2.symbol && @board.b2.symbol == @board.a3.symbol && @board.c1.symbol != ""
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