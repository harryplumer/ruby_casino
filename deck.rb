require 'pry'
require_relative 'card'

class Deck
  attr_accessor :cards
  def initialize(num_decks, game)
    @suits = ['Spades','Clubs','Diamonds','Hearts']
    @nums = ['A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K']
    @cards = generate_deck(num_decks, game)
  end

  def generate_deck(num_decks, game)
    decks = []
    for i in (1..num_decks)
      @suits.each do |suit|
        @nums.each{ |num| decks << Card.new(num, suit, game)}
      end
      i += 1
    end
    decks
  end

  def shuffle_cards
    @cards.shuffle
  end

end
