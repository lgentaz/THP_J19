require 'pry'

class Player

	attr_accessor :name, :symbol
		
	def initialize(pseudo, symb)
		@name = pseudo
		@symbol = symb
	end	
	
end