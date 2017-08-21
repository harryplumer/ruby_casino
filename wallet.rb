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

  def ask_for_bet()
    puts "How much would you like to bet?"
      bet = gets.to_f
      if bet > @amount
        puts "Error, you don't have that much! Please choose again."
        ask_for_bet
      else
        bet
      end
  end
  #TODO: should have other methods to add or sub from wallet
end
