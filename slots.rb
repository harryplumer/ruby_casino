require_relative 'sounds'

class Slots
  def initialize(player)
    puts "
    _____ _      ____ _______ _____ 
   / ____| |    / __ \__   __/ ____|
  | (___ | |   | |  | | | | | (___  
   \___ \| |   | |  | | | |  \___ \ 
   ____) | |___| |__| | | |  ____) |
  |_____/|______\____/  |_| |_____/ 
                                    "
    @player = player
    @sounds = Sound.new
    @options = ["BAR", "777", "ORANGE", "CHERRY", "WATERMELON", "GRAPE", "LIME", "DIAMOND", "$$$", "BANANA"]
    puts "Welcome to slots, #{@player.name}"
    play_round
  end

  def play_round
    @machine = ["", "", ""]
    puts "You win your bet if you get 2 matches and win double your bet if you get 3 matches!"
    bet = @player.wallet.ask_for_bet
    result = spin_machine
    
    if result == 0
      you_lose(bet)
    else
      you_win(bet)
    end

  end

  def spin_machine
    for i in 0..2
      @sounds.beginslot.play
      @machine[i] = @options[rand(0..9)]
      print("\t#{@machine[i]}\t")
      sleep(1.5)
    end
    
    matches = 0
    if @machine[0] == @machine[1]
      matches += 1
      if @machine[0] == @machine[2]
        matches += 1
      end
    elsif @machine[0] == @machine[2]
      matches = 1
    elsif @machine[1] == @machine[2]
      matches = 1
    else
      matches = 0
    end
  end

  def you_lose(bet)
    @sounds.no.play
    puts "\nSorry, you lose"
    @player.wallet.subtract(bet)
    end_round
  end

  def you_win(bet)
    @sounds.winning.play
    win_amount = bet * result
    puts "\nCongratulations, you won \$#{win_amount}"
    @player.wallet.add(win_amount)
    end_round
  end

  def end_round
    puts "Press enter to play again or type quit to return to Main Manu"
    if gets.strip.downcase != "quit"
      play_round
    end 
  end

end