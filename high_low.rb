

class HighLow
  def initialize(player)
    puts "Welcome To High Low: #{player.name}"
    puts "You have #{player.wallet.amount} to bet with!"
    bet = player.wallet.ask_for_bet
    #Ask player for bet
    #error checking for amount and data type
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
          puts " You win! #{@second_num} is higher than #{@first_num}."
          player.wallet.add(bet)
        else
          puts "You lose! #{@second_num} is lower than #{@first_num}."
          player.wallet.subtract(bet)
        end
      end

      if @first_num > @second_num
        if choice.downcase == "lower"
          puts " You win! #{@second_num} is lower than #{@first_num}."
          player.wallet.add(bet)
        else
          puts "You lose! #{@second_num} is higher than #{@first_num}."
          player.wallet.subtract(bet)
        end
      end
      puts "Press enter to play again or type quit to return to Main Manu"
          if gets.strip.downcase != "quit"
            HighLow.new(player)
          end
  end

end
