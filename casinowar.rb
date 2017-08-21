require 'pry'

require_relative 'deck'
@player = []
@dealer = []

class Casinowar
  def initialize
    puts "Welcome to casino war"
    @deck = Deck.new("6")
    puts "How much would you like to bet"
    bet = player.wallet.ask_for_bet
    result = draw_card(bet)
    @dealer << draw_card.pop
    @player << draw_card.pop

    if @player <= @dealer
      puts "Player has won"
    else
      puts "Dealer has won"
    end

  end

  def draw_card
    generate_deck
    shuffle_cards
    draw_card.pop
    puts "You have drawn card "
  end






end
