require 'pry'

require_relative 'deck'
@player = []
@dealer = []

class CasinoWar
  def initialize (player)
    puts "Welcome to casino war"
    @deck = Deck.new(6, "casinowar")
    @deck = @deck.shuffle_cards
    puts "How much would you like to bet"
    bet = player.wallet.ask_for_bet
    @user_hand = []
    @dealer_hand = []
    @user_hand << @deck.pop
    @dealer_hand << @deck.pop
    puts "Player Hand is #{@user_hand[0].display_card}"
    puts "Dealer_hand is #{@dealer_hand[0].display_card}"

    if @user_hand[0].val > @dealer_hand[0].val
      puts "Player has won"
      player.wallet.add(bet)
      puts "You won #{bet}"
    else
      puts "Dealer has won"
      player.wallet.subtract(bet)
    end

  end


  def draw_card(bet)
    generate_deck
    draw_card.pop
    puts "You have drawn card "
  end






end
