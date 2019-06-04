# frozen_string_literal: true

# Instances of Transaction class will be stored in the main account class
class Transaction
  attr_reader :amount, :date, :type, :current_balance

  def initialize(amount, type, account_balance, date = Time.now)
    @amount = amount
    @date = date
    @type = type
    @current_balance = type == 'debit' ? (account_balance - amount) : (account_balance + amount)
  end
end
