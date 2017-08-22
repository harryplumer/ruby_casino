require 'pry'
require_relative 'deck'
require_relative 'sounds'
@player = []
@dealer = []
class CasinoWar
  def initialize (player)
    @sounds = Sound.new
    @player = player
<<<<<<< HEAD
    puts "Welcome to casino war"
    @deck = Deck.new(6, "casinowar")
    @deck = @deck.shuffle_cards
    puts "How much would you like to bet"

=======
    puts "
    
    .o88b.  .d8b.  .d8888. d888888b d8b   db  .d88b.      db   d8b   db  .d8b.  d8888b.
    d8P  Y8 d8' `8b 88'  YP   `88'   888o  88 .8P  Y8.     88   I8I   88 d8' `8b 88  `8D
    8P      88ooo88 `8bo.      88    88V8o 88 88    88     88   I8I   88 88ooo88 88oobY'
    8b      88~~~88   `Y8b.    88    88 V8o88 88    88     Y8   I8I   88 88~~~88 88`8b
    Y8b  d8 88   88 db   8D   .88.   88  V888 `8b  d8'     `8b d8'8b d8' 88   88 88 `88.
     `Y88P' YP   YP `8888Y' Y888888P VP   V8P  `Y88P'       `8b8' `8d8'  YP   YP 88   YD "
    puts "Welcome to Casino War, #{@player.name}"
    @deck = Deck.new(6, "casinowar")
    @deck = @deck.shuffle_cards
    puts "How much would you like to bet"
>>>>>>> UI updates and roulette workover
    @bet = @player.wallet.ask_for_bet
    @user_hand = []
    @dealer_hand = []
    @user_hand << @deck.pop
    @dealer_hand << @deck.pop
<<<<<<< HEAD

    evaluate_hand(@user_hand[0], @dealer_hand[0])
  end

  def deal_card(card)
    sleep(1)
    #add sounds
    str = card.display_card
  end

=======
    evaluate_hand(@user_hand[0], @dealer_hand[0])
  end

  def deal_card(card)
    sleep(1)
    #add sounds
    str = card.display_card
  end

>>>>>>> UI updates and roulette workover
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
<<<<<<< HEAD



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

=======
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

>>>>>>> UI updates and roulette workover
  def start_war
    puts "You chose war!"
    @bet *= 2
    @user_hand << @deck.pop
    @dealer_hand << @deck.pop
    evaluate_hand(@user_hand.last, @dealer_hand.last)
  end
<<<<<<< HEAD

end
=======
  
end
>>>>>>> UI updates and roulette workover
