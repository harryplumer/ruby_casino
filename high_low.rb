require_relative 'sounds'

class HighLow
  def initialize(player)
    @sounds = Sound.new
    @player = player
    puts "
    _    _ _____ _____ _    _   _      ______          __
   | |  | |_   _/ ____| |  | | | |    / __ \ \        / /
   | |__| | | || |  __| |__| | | |   | |  | \ \  /\  / / 
   |  __  | | || | |_ |  __  | | |   | |  | |\ \/  \/ /  
   | |  | |_| || |__| | |  | | | |___| |__| | \  /\  /   
   |_|  |_|_____\_____|_|  |_| |______\____/   \/  \/    
                                                        "
    puts "Welcome To HighLow, #{player.name}!"
    play_hand
    #Ask player for bet
    #error checking for amount and data type
  end
   
  def play_hand
    bet = @player.wallet.ask_for_bet

    @first_num = rand(100) + 1
    @second_num = rand(100) + 1
    
    while @second_num == @first_num
      @second_num = rand(100) + 1
    end

    puts "Is the next number Higher or Lower than #{@first_num}?"
      choice = gets.strip
      while choice.downcase != "higher" && choice.downcase != "lower"
        puts "Please enter either higher or lower"
        choice = gets.strip
      end

    if @first_num < @second_num
      if choice.downcase == "higher"
        you_win(choice, bet)
      else
        you_lose(choice, bet)
      end
    end

    if @first_num > @second_num
      if choice.downcase == "lower"
          you_win(choice, bet)
      else
          you_lose(choice, bet)
      end
    end

  end

  def you_win(choice, bet)
    @sounds.winning.play
    puts "You win! #{@second_num} is #{choice} than #{@first_num}."
    @player.wallet.add(bet)
    end_hand
  end
  
  def you_lose(choice, bet)
    @sounds.lose.play
    puts "You lose! #{@second_num} is not #{choice} than #{@first_num}."
    @player.wallet.subtract(bet)
    end_hand
  end

  def end_hand
    puts "Press enter to play again or type quit to return to Main Manu"
    if gets.strip.downcase != "quit"
      play_hand
    end 
  end

end
