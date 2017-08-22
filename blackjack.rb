require 'pry'
require_relative 'deck'
require_relative 'sounds'

class Blackjack
  attr_accessor :deck
  def initialize(player)
    @sounds = Sound.new
    @deck = Deck.new(6, "blackjack")
    @deck = @deck.shuffle_cards
    @player = player
    puts "
    ____  _               _____ _  __    _         _____ _  __
   |  _ \| |        /\   / ____| |/ /   | |  /\   / ____| |/ /
   | |_) | |       /  \ | |    | ' /    | | /  \ | |    | ' / 
   |  _ <| |      / /\ \| |    |  < _   | |/ /\ \| |    |  <  
   | |_) | |____ / ____ \ |____| . \ |__| / ____ \ |____| . \ 
   |____/|______/_/    \_\_____|_|\_\____/_/    \_\_____|_|\_\
                                                              "
    puts "Welcome to blackjack, #{@player.name}!"                                                      
    init_hand
  end
  
  def init_hand
    if @deck.length < 25
      @deck = @deck.shuffle_cards      
      puts "Shuffling deck..."
      sleep(1)
    end
    
    @bet = @player.wallet.ask_for_bet
    
    @user_hand = []
    @dealer_hand = []

    @user_hand << @deck.pop
    @dealer_hand << @deck.pop
    @user_hand << @deck.pop
    @dealer_hand << @deck.pop
    
    display_hand_start
  end

  def display_hand_start
    puts "Dealing the cards..."
    sleep(1)
    puts "The dealer is showing the #{@dealer_hand[0].display_card}"
    puts "You have the #{@user_hand[0].display_card} and #{@user_hand[1].display_card} for a total of #{get_hand_total(@user_hand)}"
    
    #check for dealer and user blackjack
    if check_blackjack(@dealer_hand)
      if check_blackjack(@user_hand)
        puts "You both have blackjack, the hand is a push"
        end_hand
      else
        puts "The dealer has blackjack with #{@dealer_hand[0].display_card} and #{@dealer_hand[1].display_card}"
        @sounds.no.play
        puts "You lose \$#{@bet}"
        @player.wallet.subtract(@bet)
        end_hand
      end
    elsif check_blackjack(@user_hand)
      puts "You have blackjack with #{@user_hand[0].display_card} and #{@user_hand[1].display_card}!"
      @sounds.winning.play
      puts "You win \$#{@bet * 1.5}"
      @player.wallet.add(@bet * 1.5)
      end_hand
    else
      hand_menu(1)
    end
  end

  def hand_menu(stage)
    
    valid_choices = 2
    puts "--- YOUR CHOICES ---"
    puts "1) Hit"
    puts "2) Stand"
    if stage == 1
      puts "3) Double Down"
      valid_choices += 1
    end
    
    case gets.to_i
    when 1
      hit(false)
    when 2
      check_dealer
    when 3
      if valid_choices >= 3
        @bet *= 2
        hit(true)
      else
        invalid_input
      end
    when 4
      if valid_choices >= 4
        #split
      else
        invalid_input
      end
    else
      invalid_input
    end

  end

  def invalid_input(stage)
    puts "Invalid input, please try again"
    hand_menu(stage)
  end

  def hit(double_down)
    sleep(1)
    @user_hand << @deck.pop
    total = get_hand_total(@user_hand)
    if total > 21
      user_bust
    else
      puts "You received the #{@user_hand.last.display_card} and have a total of #{total} "
      if (double_down)
        check_dealer
      else
        hand_menu(2)
      end
    end
  end

  def check_blackjack(hand)
    if hand[0].num == 'A' && hand[1].val == 10
      true
    elsif hand[1].num == 'A' && hand[0].val == 10
      true
    else
      false
    end
  end

  def check_dealer
    sleep(1)
    print "The dealer is holding "
    @dealer_hand.each{|card| print "the #{card.display_card} "}
    total = get_hand_total(@dealer_hand)
    print "for a total of #{total}\n"
    if total >= 17
      evaluate_hand
    else
      @dealer_hand << deck.pop
      check_dealer
    end
  end

  def user_bust
    puts "You received the #{@user_hand.last.display_card} and busted with a total of #{get_hand_total(@user_hand)}. You lose \$#{@bet}."
    @sounds.no.play
    @player.wallet.subtract(@bet)
    end_hand
  end

  def evaluate_hand
    user_total = get_hand_total(@user_hand)
    dealer_total = get_hand_total(@dealer_hand)

    if dealer_total > 21
      puts "The dealer busts with #{dealer_total} and you win \$#{@bet}!"
      @sounds.winning.play
      @player.wallet.add(@bet)
    elsif user_total > dealer_total
      puts "You win the hand with #{user_total} and you win \$#{@bet}"
      @sounds.winning.play
      @player.wallet.add(@bet)
    elsif user_total < dealer_total
      puts "You lose the hand with #{user_total} and lose \$#{@bet}"
      @sounds.no.play
      @player.wallet.subtract(@bet)
    else
      puts "The hand was a push"
    end

    end_hand
  end


  def get_hand_total(hand)
    total = 0
    aces = 0
    hand.each do |card| 
      if card.num == 'A'
        total += 11
        aces += 1 
      else
        total += card.val
      end 
    end
    
    if total > 21
      total -= (aces*10)
    else
      total
    end
  end

  def end_hand
    puts "Press enter to play again or type quit to return to main menu"
    if gets.strip.downcase != "quit"
      init_hand
    end
  end

end

