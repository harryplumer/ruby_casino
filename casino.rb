require 'pry'
require 'sounder'

require_relative 'player'
require_relative 'high_low'
require_relative 'slots'
require_relative 'blackjack'
require_relative 'casinowar'
require_relative 'roulette'

class Casino
  attr_accessor :players

  def initialize
    puts 'Welcome To The Ruby Casino'
    @players = []
    @active_player = Player.new
    @players << @active_player
    menu
  end

  def menu
    puts "1) Play HighLow"
    puts "2) Play Slots"
    puts "3) Play Blackjack"
    puts "4) Play Casinowar"
    puts "5) Play Roulette"
    puts "6) Change/Add Players"
    puts "6) Quit"
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
          Roulette.new(@player)
      when 6
        player_menu
      when 7
        puts "Thanks for stopping by the casino"
        exit
      else
        puts "Invalid Choice! Try again!"
        menu
    end
    menu
  end

  def player_menu
    puts "--- PLAYER SELECT MENU ---"
    @players.each_with_index{|player, index| puts "#{index+1}: #{player.name} \(\$#{player.wallet.amount}\)"}
  end





end

Casino.new
