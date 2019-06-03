# frozen_string_literal: true

require 'transaction'

describe Transaction do
  it 'it stores the transaction amount' do
    transaction = Transaction.new(200)
    expect(transaction.amount).to eq 200
  end
end
