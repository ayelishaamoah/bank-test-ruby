require_relative './transaction'
# frozen_string_literal: true

# Main application interface
class Bank
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    create_transaction(amount, 'credit')
  end

  def withdraw(amount)
    create_transaction(amount, 'debit')
  end

  def show_balance
    @balance
  end

  private

  def create_transaction(amount, type)
    transaction = Transaction.new(amount, type, @balance)
    save_transaction(transaction)
    update_balance(transaction)
  end

  def save_transaction(transaction)
    @transactions.push(transaction)
  end

  def update_balance(transaction)
    @balance = transaction.current_balance
  end
end
