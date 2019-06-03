class Account
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def showBalance
    return @balance
  end
end
