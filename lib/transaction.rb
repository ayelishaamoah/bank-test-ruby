# frozen_string_literal: true

# Instances of Transaction class will be stored in the main account class
class Transaction
  attr_reader :amount, :date

  def initialize(amount, date = Time.now)
    @amount = amount
    @date = date
  end
end
