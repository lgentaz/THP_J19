require 'pry'

class Player

# Initialisation de la classe Player; prend 1 nom et un symbol
	attr_accessor :name, :symbol
	
	def initialize(pseudo, symb)
		@name = pseudo
		@symbol = symb
	end		

end