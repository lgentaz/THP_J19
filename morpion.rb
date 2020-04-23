require 'pry'
require 'bundler'
Bundler.require
require_relative 'lib/app'
require_relative 'lib/game'
require_relative 'lib/show'


tic_tac_toe = App.new
overall_rounds = 0

while tic_tac_toe.continue do
	tic_tac_toe.match
	tic_tac_toe.again?
	overall_rounds += 1
end



puts "On a jouer #{overall_rounds} parties."