require 'pry'
require_relative 'board'
require_relative 'game'

class Show

# Initialise des valeurs pour chacune position de la grille graphique et les associe au tableau des	cases
# plus spécifiquement les symboles qu'il contient; cf board.rb et board_case.rb
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
	
# Ecriture de la grille dans le terminal
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

# Rafraichissement de la page en début de partie
	def start
		system "clear"
		self.top
		puts ""
	end	


# En-tête du jeu (toujours présente)
	def top
		puts ""
		puts " " * 10 + "-" * 51
		puts " " * 10 + "|           Bienvenue dans TIC TOC TOQUE          |"
		puts " " * 10 + "|   Jeu de morpion (les insectes sont nos amis)   |"
		puts " " * 10 + "-" * 51
		puts ""
	end

# Rafraichissement de la page en cours de partie, mise a jour des cases jouées
	def play
		system "clear"
		self.top
		puts ""
		self.grid		
	end
	
end

