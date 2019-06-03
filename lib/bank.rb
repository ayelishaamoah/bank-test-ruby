# frozen_string_literal: true

# Main application interface
class Bank
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    transaction = Transaction.new(amount)
    @transactions.push(transaction)
    @balance += transaction.amount
  end

  def withdraw(amount)
    transaction = Transaction.new(-amount)
    @transactions.push(transaction)
    @balance += transaction.amount
  end

  def show_balance
    @balance
  end
end
