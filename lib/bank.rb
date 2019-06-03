# frozen_string_literal: true

# Main application interface
class Bank
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end

  def show_balance
    @balance
  end
end
