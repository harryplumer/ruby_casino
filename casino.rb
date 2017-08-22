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
    puts "
    /$$$$$$   /$$$$$$   /$$$$$$  /$$$$$$ /$$   /$$  /$$$$$$ 
   /$$__  $$ /$$__  $$ /$$__  $$|_  $$_/| $$$ | $$ /$$__  $$
  | $$  \__/| $$  \ $$| $$  \__/  | $$  | $$$$| $$| $$  \ $$
  | $$      | $$$$$$$$|  $$$$$$   | $$  | $$ $$ $$| $$  | $$
  | $$      | $$__  $$ \____  $$  | $$  | $$  $$$$| $$  | $$
  | $$    $$| $$  | $$ /$$  \ $$  | $$  | $$\  $$$| $$  | $$
  |  $$$$$$/| $$  | $$|  $$$$$$/ /$$$$$$| $$ \  $$|  $$$$$$/
   \______/ |__/  |__/ \______/ |______/|__/  \__/ \______/ 
                                                            "
    @players = []
    puts "To begin you must add a player!"
    @active_player = Player.new
    @players << @active_player
    menu
  end

  def menu
    puts "CURRENT PLAYER: #{@active_player.name} \(\$#{'%.2f' % @active_player.wallet.amount}\)"
    puts " --- MAIN MENU ---"
    puts "1) Play HighLow"
    puts "2) Play Slots"
    puts "3) Play Blackjack"
    puts "4) Play Casino War"
    puts "5) Play Roulette"
    puts "6) Change/Add Players"
    puts "7) Quit"
    case gets.to_i
      when 1
        HighLow.new(@active_player)
        random_events
        menu
      when 2
        Slots.new(@active_player)
        random_events
        menu
      when 3
        Blackjack.new(@active_player)
        random_events
        menu
      when 4
        CasinoWar.new(@active_player)
        random_events
        menu
      when 5
        Roulette.new(@active_player)
        random_events
        menu
      when 6
        player_menu
        menu
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
    @players.each_with_index{|player, index| puts "#{index+1}: #{player.name} \(\$#{'%.2f' % player.wallet.amount}\)"}
    puts "#{players.length+1}: Add new player"
    choice = gets.strip.to_i
    if choice == 0 || choice > players.length+1
      puts "Invalid input, please try again."
      player_menu
    elsif choice <= players.length
      @active_player = @players[choice-1]
    else choice == players.length
      @active_player = Player.new
      @players << @active_player
    end
  end

  def random_events
    events = [{event: "Get caught cheating, pit boss breaks your hand. Lose $20", result: -20},
              {event: "Mob boss finds you in the bathroom, gives you swirly. Lose $50", result: -50},
              {event: "Hooker tricks you into going upstairs. Lose $250", result: -250},
              {event: "Drunk guy drops his wallet and you find it. Get $150", result: 150},
              {event: "Your preseason Super Bowl bet comes back from 28-3 down to win. Get $500", result: 500}
    ]

    num = rand(41)
    if num < events.length
      puts "RANDOM EVENT: #{events[num][:event]}"
      @active_player.wallet.add(events[num][:result])
      sleep(1)
    end
  end

end

Casino.new
