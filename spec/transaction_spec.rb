# frozen_string_literal: true

require 'transaction'

describe Transaction do
  it 'stores the transaction amount' do
    transaction = Transaction.new(200, 'credit')
    expect(transaction.amount).to eq 200
  end

  it 'stores the transaction date' do
    date_now = Time.now
    transaction = Transaction.new(200, 'credit', date_now)
    expect(transaction.date).to eq date_now
  end

  it 'stores the transaction type' do
    transaction = Transaction.new(200, 'debit')
    expect(transaction.type).to eq 'debit'
  end
end
