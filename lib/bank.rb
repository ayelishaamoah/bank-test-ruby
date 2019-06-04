require_relative './transaction'
require_relative './statement'
# frozen_string_literal: true

# Main application interface
class Bank
  attr_reader :balance, :transactions

  def initialize(transaction = Transaction)
    @balance = 0
    @transactions = []
    @transaction = transaction
  end

  def deposit(amount)
    new_transaction = create_transaction(amount, 'credit')
    save_transaction(new_transaction)
    update_balance(new_transaction)
  end

  def withdraw(amount)
    new_transaction = create_transaction(amount, 'debit')
    save_transaction(new_transaction)
    update_balance(new_transaction)
  end

  def show_balance
    @balance
  end

  def print_statement(statement = Statement.new)
    statement.print_statement(@transactions)
  end

  private

  def create_transaction(amount, type)
    @transaction.new(amount, type, @balance)
  end

  def save_transaction(transaction)
    @transactions.push(transaction)
  end

  def update_balance(transaction)
    @balance = transaction.current_balance
  end
end
