require_relative 'wallet'

class Player
  attr_accessor :name, :age, :wallet
  def initialize
    puts "What's your name, player?"
    @name = gets.strip
    get_age
    get_initial_amount
  end

  def get_initial_amount
    puts "How much money are you playing with today, #{name}?"
    amount = Float(gets.strip) rescue false
    if amount
      if amount == 0
        puts "You need cash to play at this casino!"
        get_initial_amount
      else
        @wallet = Wallet.new(amount)
      end
    else
      puts "Please enter a valid number!"
      get_initial_amount
    end
  end

  def get_age
    puts "How old are you, #{name}?"
    age = Integer(gets.strip) rescue false
    if age
      if age < 21
        puts "That's not old enough to play here, #{name}. Maybe try getting a fake ID!"
        get_age
      else
        @age = age
      end
    else
      puts "Please enter a valid integer!"
      get_age
    end
  end

end
