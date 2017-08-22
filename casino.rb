require 'pry'

require_relative 'player'
require_relative 'high_low'
require_relative 'slots'
require_relative 'blackjack'
require_relative 'casinowar'

class Casino
  attr_accessor :players

  def initialize
    puts 'Welcome To The Ruby Casino'
    @player = Player.new
    menu
  end

  def menu
    puts "1) Play HighLow"
    puts "2) Play Slots"
    puts "3) Play Blackjack"
    puts "4) Play Casinowar"
    puts "5) Quit"
    case gets.to_i
      when 1
        HighLow.new(@player)
        puts "Press enter to play again or type quit to return to Main Manu"
        if gets.strip.downcase == "quit"
          menu
        else
          HighLow.new(@player)
        end
      when 2
        Slots.new(@player)
        puts "Press enter to play again or type quit to return to Main Manu"
        if gets.strip.downcase == "quit"
          menu
        else
          Slots.new(@player)
        end
      when 3
        Blackjack.new(@player)
        menu
      when 4
        CasinoWar.new(@player)
        puts "Press enter to play again or type quit to return to Main Menu"
        if gets.strip.downcase == "quit"
          menu
        else
          CasinoWar.new(@player)
        end
      when 5
        puts "Thanks for stopping by the casino"
        exit
      else
        puts "Invalid Choice! Try again!"
        menu
    end
    menu
  end
end

Casino.new
