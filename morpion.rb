require 'pry'
require 'bundler'
Bundler.require
require_relative 'lib/app'
require_relative 'lib/game'
require_relative 'lib/show'


overall_rounds = 0
overall_win = []

tic_tac_toe = App.new

while tic_tac_toe.continue do
	tic_tac_toe.match
	tic_tac_toe.again?
	overall_win << tic_tac_toe.won?
	overall_rounds += 1
end


puts overall_win
puts "On a jouer #{overall_rounds} parties."