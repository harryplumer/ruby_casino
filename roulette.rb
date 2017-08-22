require_relative 'sounds'

class Roulette
  def initialize(player)
    puts "
    ____   __   _  _  __    ____  ____  ____  ____ 
   (  _ \ /  \ / )( \(  )  (  __)(_  _)(_  _)(  __)
    )   /(  O )) \/ (/ (_/\ ) _)   )(    )(   ) _) 
   (__\_) \__/ \____/\____/(____) (__)  (__) (____)
  "
  
    puts "Welcome To Roulette: #{player.name}"
    @sounds = Sound.new 
    @player = player
    @bets = []
    @total = 0
    @numbers = [
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
    bet_menu

 end

 def bet_menu
  puts "1) Bet on specific number (35:1 payout)."
  puts "2) Bet on even numbers (1:1 payout)."
  puts "3) Bet on odd numbers (1:1 payout)."
  puts "4) Bet on red (1:1 payout)."
  puts "5) Bet on black (1:1 payout)."
  puts "6) Spin Wheel"

  case gets.strip.to_i
    when 1
      bet_amount = @player.wallet.ask_for_bet
      number_bet(bet_amount)
      bet_menu
    when 2
      bet_amount = @player.wallet.ask_for_bet
      even_odd_bet("even", bet_amount)
      bet_menu
    when 3
      bet_amount = @player.wallet.ask_for_bet
      even_odd_bet("odd", bet_amount)
      bet_menu
    when 4
      bet_amount = @player.wallet.ask_for_bet
      red_black_bet("red", bet_amount)
      bet_menu
    when 5
      bet_amount = @player.wallet.ask_for_bet
      red_black_bet("black", bet_amount)
      bet_menu
    when 6
      spin_wheel
    else "Invalid input, please start bet over/"
      bet_menu
  end
end

def number_bet(bet_amount)
  puts "Choose a number to bet on between 1 and 36"
  user_input = gets.strip.to_i
  if user_input == 0 || user_input > 36
    puts "Invalid input, please enter a number between 1 and 36"
    number_bet(bet_amount)
  else
    puts "\$#{bet_amount} placed on #{user_input}!"
    @bets << {bet_type: "num", bet_amount: bet_amount, bet_val: user_input}
    @player.wallet.subtract(bet_amount)
  end
end

def even_odd_bet(even_odd, bet_amount)
  puts "\$#{bet_amount} placed on #{even_odd}!"
  @bets << {bet_type: "even_odd", bet_amount: bet_amount, bet_val: even_odd}
  @player.wallet.subtract(bet_amount)
end

def red_black_bet(red_black, bet_amount)
  puts "\$#{bet_amount} placed on #{red_black}!"
  @bets << {bet_type: "red_black", bet_amount: bet_amount, bet_val: red_black}
  @player.wallet.subtract(bet_amount)
end
          

def spin_wheel
  print "Spinning wheel"
  @sounds.roulette.play
  for i in 1..25
    print "."
    sleep(0.1)
  end
  print "\n"
  @number = @numbers[rand(36)]
  list_bets
end

def list_bets
  puts "THE NUMBER ROLLED WAS: #{@number[:num]}"
  puts "--- YOUR RESULTS ----"
  @bets.each do |bet|
    if bet[:bet_type] == "num"
      if bet[:bet_val] == @number[:num]
        win_bet(bet, 35)
      else 
        lose_bet(bet)
      end
    elsif bet[:bet_type] == "even_odd"
      if bet[:bet_val] == @number[:difference]
        win_bet(bet, 1)
      else
        lose_bet(bet)
      end
    else
      if bet[:bet_val] == @number[:color]
        win_bet(bet, 1)
      else
        lose_bet(bet)
      end
    end
  end

  if @total > 0
    puts "Overall, you won \$#{'%.2f' % @total}"
    @player.wallet.add(@total)
  elsif @total == 0
    puts "Overall, you broke even"
  else
    puts "Overall, you lost \$#{'%.2f' % @total}"
  end

end_spin
end

  def win_bet(bet, odds)
    puts "Your \$#{'%.2f' % bet[:bet_amount]} bet on #{bet[:bet_val]} was a winner! You win \$#{'%.2f' % bet[:bet_amount] * odds}!"
    @total += (bet[:bet_amount] * odds)
    @player.wallet.add(bet[:bet_amount])
  end

  def lose_bet(bet)
    puts "Your \$#{'%.2f' % bet[:bet_amount]} bet on #{bet[:bet_val]} was a loser!"
    @total -= bet[:bet_amount]
  end

  def end_spin
    puts "Press enter to play again or type quit to return to main menu"
    if gets.strip.downcase != "quit"
      @bets = []
      @total = 0
      bet_menu
    end
  end

end