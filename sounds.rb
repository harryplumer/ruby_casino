require 'sounder'
require 'pry'

class Sound

  def initialize
    @welcome = Sounder::Sound.new "assets/welcome.wav"
    @winning = Sounder::Sound.new "assets/winslot.wav"
    @beginslot = Sounder::Sound.new "assets/beginslot.mp3"
  end

  def winning
    @winning.play
  end
end
