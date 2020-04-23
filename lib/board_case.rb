require 'pry'

class BoardCase

# Initialisation d'une case, prend une coordonnée et lui associe une position et un symbole.
# Symbole de départ: vide
	attr_accessor :position, :symbol
		
	def initialize(coordinates)
		@position = coordinates
		@symbol = " "
	end
 
 end