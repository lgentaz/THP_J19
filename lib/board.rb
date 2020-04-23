require 'pry'
require_relative 'board_case'

class Board

# Initialise la grille et assigne une coordonnée à chacune des cases; cf board_case.rb.
	attr_accessor :a1, :a2, :a3, :b1, :b2, :b3, :c1, :c2, :c3
	@@all_cases = []
		
	def initialize
		@a1 = BoardCase.new("A1")
		@a2 = BoardCase.new("A2")
		@a3 = BoardCase.new("A3")
		@b1 = BoardCase.new("B1")
		@b2 = BoardCase.new("B2")
		@b3 = BoardCase.new("B3")
		@c1 = BoardCase.new("C1")
		@c2 = BoardCase.new("C2")
		@c3 = BoardCase.new("C3")
	end

# Permet de classer toutes les cases dans un tableau de valeur
	def all_cases
		@@all_cases = [@a1, @a2, @a3, @b1, @b2, @b3, @c1, @c2, @c3]
		return @@all_cases
	end
	
	
end