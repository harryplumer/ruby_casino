require 'pry'
require_relative 'deck'

class Blackjack
  def initialize
    @cards = Deck.new("blackjack")
  end
end

Blackjack.new
binding.pry