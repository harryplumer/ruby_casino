class Wallet
  attr_accessor :amount
  def initialize(amount)
    @amount = amount

  end

  def add(money)
    @amount += money
  end

  def subtract(money)
    @amount -= money
  end
  #TODO: should have other methods to add or sub from wallet
end
