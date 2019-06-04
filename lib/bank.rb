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

  def print_statement
    header = ['date'.ljust(11), ' credit'.ljust(11), ' debit'.ljust(11),
              ' balance'].join('||')
    transaction_list = format_transactions
    statement = [header, transaction_list].join("\n")
    puts statement
  end

  def format_transactions
    @transactions.reverse.map do |transaction|
      credit = format_credit(transaction)
      debit = format_debit(transaction)
      [
        transaction.date.strftime('%d/%m/%Y'),
        credit.to_s.ljust(9),
        debit.to_s.ljust(9),
        format('%.2f', transaction.current_balance)
      ].join(' || ')
    end.join("\n")
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

  def format_credit(transaction)
    transaction.type == 'credit' ? format('%.2f', transaction.amount) :  ' '
  end

  def format_debit(transaction)
    transaction.type == 'debit' ? format('%.2f', transaction.amount)  :  ' '
  end
end
