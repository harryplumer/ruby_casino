class Card
  attr_accessor :val, :suit, :color
  def initialize(num, suit)
    @num = num
    @suit = suit
    case num
      when 'A'
        @val = 1
      when 'J','Q','K'
        @val = 10
      else
        @val = num
      end
  end
end


  