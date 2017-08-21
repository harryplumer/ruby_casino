require 'pry'
require_relative 'card'

class Deck
  
  def initialize
    @suits = ['Spades','Clubs','Diamonds','Hearts']
    @nums = ['A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K']
    @cards = generate_deck
  end

  def generate_deck
    deck = []
    @suits.each do |suit|
      @nums.each{ |num| deck << Card.new(num, suit)}
    end
    deck
  end

  def shuffle_cards
    @cards.shuffle
  end

end

d = Deck.new
