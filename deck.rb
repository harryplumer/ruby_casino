require 'pry'
require_relative 'card'

class Deck
  
  def initialize(game)
    @suits = ['Spades','Clubs','Diamonds','Hearts']
    @nums = ['A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K']
    if game == "blackjack"
      @cards = generate_blackjack_deck
    else
      @cards = generate_deck
  end

  def generate_deck
    deck = []
    @suits.each do |suit|
      @nums.each{ |num| deck << Card.new(num, suit)}
    end
    deck
  end

  def generate_blackjack_deck
    decks = []
    for i in (1..6)
      decks << generate_deck
    decks
  end

  def shuffle_cards
    @cards.shuffle
  end

end

d = Deck.new
