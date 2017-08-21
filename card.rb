class Card
  attr_accessor :val, :suit, :color, :num
  def initialize(num, suit, game)
    @num = num
    @suit = suit
    case num
      when 'A'
        if game == "casinowar"
          @val = 14
        else
          @val = 11
        end
      when 'K'
        if game == "casinowar"
          @val = 13
        else
          @val = 10
        end
      when 'Q'
        if game == 'casinowar'
          @val = 12
        else
          @val = 10
        end
      when 'J'
        if game == 'casinowar'
          @val = 11
        else
          @val = 10
        end
      else
        @val = num
      end
  end
  def display_card
    str = "#{@num} of #{@suit}"
  end
end


  