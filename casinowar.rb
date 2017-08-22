require 'pry'

require_relative 'deck'
require_relative 'sounds'
@player = []
@dealer = []

class CasinoWar
  def initialize (player)
    @sounds = Sound.new
    @player = player
    puts "Welcome to casino war"
    @deck = Deck.new(6, "casinowar")
    @deck = @deck.shuffle_cards
    puts "How much would you like to bet"

    @bet = @player.wallet.ask_for_bet
    @user_hand = []
    @dealer_hand = []
    @user_hand << @deck.pop
    @dealer_hand << @deck.pop

    evaluate_hand(@user_hand[0], @dealer_hand[0])
  end

  def deal_card(card)
    sleep(1)
    #add sounds
    str = card.display_card
  end

  def evaluate_hand(user_card, dealer_card)
    puts "Player Hand is #{deal_card(user_card)}"
    puts "Dealer Hand is #{deal_card(dealer_card)}"
    if user_card.val > dealer_card.val
      puts "Player has won"
      @player.wallet.add(@bet)
      puts "You won #{@bet}"
      @sounds.winning.play
    elsif user_card.val < dealer_card.val
      @sounds.no.play
      puts "Dealer has won"
      @player.wallet.subtract(@bet)
    else
      war_menu
    end



  end

  def war_menu
    puts "Type 1 to go to War and double your bet"
    puts "Type 2 to surrender and lose half your bet"
    case gets.to_i
      when 1
        start_war
      when 2
        loss = @bet / 2
        puts "You surrender and lose \$#{loss}"
        @player.wallet.subtract(loss)
      else
        puts "Please enter valid input"
        war_menu
    end
  end

  def start_war
    puts "You chose war!"
    @bet *= 2
    @user_hand << @deck.pop
    @dealer_hand << @deck.pop
    evaluate_hand(@user_hand.last, @dealer_hand.last)
  end

end
