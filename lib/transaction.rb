# frozen_string_literal: true

# Instances of Transaction class will be stored in the main account class
class Transaction
  attr_reader :amount

  def initialize(amount)
    @amount = amount
  end
end
