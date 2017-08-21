require 'pry'
require_relative 'deck'

class Blackjack
  attr_accessor :deck
  def initialize
    @deck = Deck.new(6)
  end

  def new_shoe
    @deck = @deck.shuffle_cards
  end
  
  def play_hand
    @user_hand = []
    @dealer_hand = []

    @user_hand << @deck.pop
    @dealer_hand << @deck.pop
    @user_hand << @deck.pop
    @dealer_hand << @deck.pop

    display_hand_start
  end

  def display_hand_start
    



  end

  def get_hand_total(hand)
    total = 0
    hand.each{|card| total += card.val }


  end


end

x = Blackjack.new
binding.pry