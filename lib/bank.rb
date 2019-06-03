# frozen_string_literal: true

# Main application interface
class Bank
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(amount)
    transaction = Transaction.new(amount)
    @balance += transaction.amount
  end

  def withdraw(amount)
    transaction = Transaction.new(-amount)
    @balance += transaction.amount
  end

  def show_balance
    @balance
  end
end
