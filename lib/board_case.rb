require 'pry'

class BoardCase

	attr_accessor :position, :symbol
		
	def initialize(coordinates)
		@position = coordinates
		@symbol = " "
	end
 
 end