class Card
  attr_accessor :val, :suit, :color, :num
  def initialize(num, suit, game)
    @num = num
    @suit = suit
    if game == "casinowar"
      case num
        when 'A'
          @val = 14
        when 'K'
          @val = 13
        when 'Q'
          @val = 12
        when 'J'
          @val = 11
        else
          @val = num
      end
    else
      case num
        when 'A'
          @val = 11
        when 'K', 'Q', 'J'    
          @val = 10
        else
          @val = num  
        end
      end
  end
  
  def display_card
    str = "#{@num} of #{@suit}"
  end
end


  