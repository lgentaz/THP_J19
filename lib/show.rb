require 'pry'
#require_relative 'app'
require_relative 'board'
#require_relative 'board_case'
require_relative 'game'
#require_relative 'player'

class Show

	def initialize(arr)
		@a1 = arr[0].symbol
		@a2 = arr[1].symbol
		@a3 = arr[2].symbol
		@b1 = arr[3].symbol
		@b2 = arr[4].symbol
		@b3 = arr[5].symbol
		@c1 = arr[6].symbol
		@c2 = arr[7].symbol
		@c3 = arr[8].symbol
	end
	
	def grid
		puts " " * 12 + "1" + " " * 5 + "2" + " " * 5 + "3"
		puts " " * 11 + "---" + " " * 3 + "---" + " " * 3 + "---"
		puts " " * 6 + "A" + " "* 2 + "|" + " "* 2 + "#{@a1}" +" "* 2 + "|" + " "* 2 + "#{@a2}" +" "* 2 + "|" + " "* 2 + "#{@a3}" +" "* 2 + "|"
		puts " " * 11 + "---" + " " * 3 + "---" + " " * 3 + "---"
		puts " " * 6 + "B" + " "* 2 + "|" + " "* 2 + "#{@b1}" +" "* 2 + "|" + " "* 2 + "#{@b2}" +" "* 2 + "|" + " "* 2 + "#{@b3}" +" "* 2 + "|"
		puts " " * 11 + "---" + " " * 3 + "---" + " " * 3 + "---"
		puts " " * 6 + "C" + " "* 2 + "|" + " "* 2 + "#{@c1}" +" "* 2 + "|" + " "* 2 + "#{@c2}" +" "* 2 + "|" + " "* 2 + "#{@c3}" +" "* 2 + "|"
		puts " " * 11 + "---" + " " * 3 + "---" + " " * 3 + "---"
		puts " "
		puts " " * 2 + "-" * 65
		puts " "
	end

	def start
		system "clear"
		self.top
		puts ""
	end	


	def top
		puts ""
		puts " " * 10 + "-" * 51
		puts " " * 10 + "|           Bienvenue dans TIC TOC TOQUE          |"
		puts " " * 10 + "|   Jeu de morpion (les insectes sont nos amis)   |"
		puts " " * 10 + "-" * 51
		puts ""
	end

	def play
		system "clear"
		self.top
		puts ""
		self.grid		
	end
	
end

