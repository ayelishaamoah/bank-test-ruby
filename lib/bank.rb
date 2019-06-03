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
    save_transaction(transaction)
    update_balance(transaction)
  end

  def withdraw(amount)
    transaction = Transaction.new(-amount)
    save_transaction(transaction)
    update_balance(transaction)
  end

  def show_balance
    @balance
  end

  private

  def save_transaction(transaction)
    @transactions.push(transaction)
  end

  def update_balance(transaction)
    @balance += transaction.amount
  end
end
