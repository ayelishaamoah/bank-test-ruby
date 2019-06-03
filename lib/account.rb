# frozen_string_literal: true

# Main application interface for user account
class Account
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
  end

  def show_balance
    @balance
  end
end
