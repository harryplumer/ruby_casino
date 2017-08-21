class Wallet
  attr_accessor :amount
  def initialize(amount)
    @amount = amount
  end

  def add(money)
    @amount += money
  end

  def subtract(money)
    @amount -= money
  end

  def ask_for_bet
    puts "How much would you like to bet?"
      bet = Float(gets.strip) rescue false
      if bet
        if bet > @amount
          puts "Error, you don't have that much! Please choose again."
          ask_for_bet
        elsif bet == 0
          puts "You must bet more than 0!"
          ask_for_bet
        else
          bet.to_f
        end
      else
        puts "Please enter a valid number for your bet"
        ask_for_bet
      end
  end
  #TODO: should have other methods to add or sub from wallet
end
