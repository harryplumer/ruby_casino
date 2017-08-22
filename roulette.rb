class Roulette
  def initialize(player)
    puts "Welcome To Roulette: #{player.name}"

   @player = player
    @bet = @player.wallet.ask_for_bet
    @number = [
      {num: "1" ,color: "red" ,difference: "odd"},
      {num: "2" ,color: "black" ,difference: "even"},
      {num: "3" ,color: "red" ,difference: "odd"},
      {num: "4" ,color: "black" ,difference: "even"},
      {num: "5" ,color: "red" ,difference: "odd"},
      {num: "6" ,color: "black" ,difference: "even"},
      {num: "7" ,color: "red" ,difference: "odd"},
      {num: "8" ,color: "black" ,difference: "even"},
      {num: "9" ,color: "red" ,difference: "odd"},
      {num: "10" ,color: "black" ,difference: "even"},
      {num: "11" ,color: "black" ,difference: "odd"},
      {num: "12" ,color: "red" ,difference: "even"},
      {num: "13" ,color: "black" ,difference: "odd"},
      {num: "14" ,color: "red" ,difference: "even"},
      {num: "15" ,color: "black" ,difference: "odd"},
      {num: "16" ,color: "red" ,difference: "even"},
      {num: "17" ,color: "black" ,difference: "odd"},
      {num: "18" ,color: "red" ,difference: "even"},
      {num: "19" ,color: "red" ,difference: "odd"},
      {num: "20" ,color: "black" ,difference: "even"},
      {num: "21" ,color: "red" ,difference: "odd"},
      {num: "22" ,color: "black" ,difference: "even"},
      {num: "23" ,color: "red" ,difference: "odd"},
      {num: "24" ,color: "black" ,difference: "even"},
      {num: "25" ,color: "red" ,difference: "odd"},
      {num: "26" ,color: "black" ,difference: "even"},
      {num: "27" ,color: "red" ,difference: "odd"},
      {num: "28" ,color: "black" ,difference: "even"},
      {num: "29" ,color: "black" ,difference: "odd"},
      {num: "30" ,color: "red" ,difference: "even"},
      {num: "31" ,color: "black" ,difference: "odd"},
      {num: "32" ,color: "red" ,difference: "even"},
      {num: "33" ,color: "black" ,difference: "odd"},
      {num: "34" ,color: "red" ,difference: "even"},
      {num: "35" ,color: "black" ,difference: "odd"},
      {num: "36" ,color: "red" ,difference: "even"}
    ]
    menu

 end

 def menu
  puts "1) Bet on specific number."
  puts "2) Bet on even numbers."
  puts "3) Bet on odd numbers."
  puts "4) Bet on red."
  puts "5) Bet on black."

 input = gets.strip.to_i
    case input
      when 1
        puts "Choose your number"
         user_input = gets.strip.to_i
         puts "Spinning"
         @number = rand(36) + 1
         if user_input == @number
           puts "You win! The winning number was #{@number}!"
           @player.wallet.add(@bet)
         else
           puts "You lose. The winning number was #{@number}."

          @player.wallet.subtract(@bet)
         end
       when 2
         puts "You chose even."
         @number = rand(36) + 1
         if @number % 2 == 0
           puts "You win! #{@number} is even!"
           @player.wallet.add(@bet)
         else
           puts "You lose. #{@number} is odd."
           @player.wallet.subtract(@bet)
         end
       when 3
         puts "You chose odd."
         @number = rand(36) + 1
         if @number % 2 != 0
           puts "You win! #{@number} is odd!"
           @player.wallet.add(@bet)
         else
           puts "You lose. #{@number} is even."
           @player.wallet.subtract(@bet)
         end
       when 4
         puts "You chose red"
         new_obj = @number.sample
         if new_obj[:color] == 'red'

            puts "You win! #{new_obj[:num]} is red"
             @player.wallet.add(@bet)
             #red
           else
             puts "You lose. #{new_obj[:num]} is black"
             @player.wallet.subtract(@bet)
         end
             #black
        when 5
          puts "You chose black"
          new_obj = @number.sample
          if new_obj[:color] == 'black'

             puts "You win! #{new_obj[:num]} is black"
              @player.wallet.add(@bet)
              #red
            else
              puts "You lose. #{new_obj[:num]} is red"
              @player.wallet.subtract(@bet)
          end

       


# new_obj = @number.sample
# new_obj[:color] == 'red'
# they win
# != 'red'
# they lose



   end


end
end