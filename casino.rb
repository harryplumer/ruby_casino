require 'pry'

require_relative 'player'
require_relative 'high_low'
require_relative 'slots'

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
    puts "3) Quit"
    case gets.to_i
      when 1
        HighLow.new(@player)
      when 2
        Slots.new(@player)
      when 3
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
