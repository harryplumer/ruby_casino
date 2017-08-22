require 'sounder'
require 'pry'

class Sound
  attr_accessor :welcome, :winning, :beginslot, :lose, :no, :diceroll, :roulette, :shufflecard
  def initialize
    @welcome = Sounder::Sound.new "assets/welcome.wav"
    @winning = Sounder::Sound.new "assets/winslot.wav"
    @beginslot = Sounder::Sound.new "assets/beginslot.mp3"
    @lose = Sounder::Sound.new "assets/lose.wav"
    @no = Sounder::Sound.new "assets/no.wav"
    @diceroll = Sounder::Sound.new "assets/diceroll.wav"
    @roulette = Sounder::Sound.new "assets/roulette.wav"
    @shufflecard = Sounder::Sound.new "assets/shufflecard.wav"
  end


end
