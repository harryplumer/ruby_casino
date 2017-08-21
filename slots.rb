class Slots
  def initialize(player)
    @machine = ["", "", ""]
    @options = ["BAR", "777", "ORANGE", "CHERRY", "WATERMELON", "GRAPE", "LIME", "DIAMOND", "$$$", "BANANA"]
    puts "You win your bet if you get 2 matches and win double your bet if you get 3 matches!"
    bet = player.wallet.ask_for_bet
    result = spin_machine(bet)
    if result == 0
      puts "\nSorry, you lose"
      player.wallet.subtract(bet)
    else
      win_amount = bet * result
      puts "\nCongratulations, you won \$#{win_amount}"
      player.wallet.add(win_amount)
    end
    
    puts "Press enter to play again or type quit to return to Main Manu"
    if gets.strip.downcase != "quit"
      Slots.new(player)
    end

  end

  def spin_machine(bet)
    for i in 0..2
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
  
end