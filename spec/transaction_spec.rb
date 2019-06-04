# frozen_string_literal: true

require 'transaction'

describe Transaction do
  it 'stores the transaction amount' do
    transaction = Transaction.new(200, 'credit', 1000)
    expect(transaction.amount).to eq 200
  end

  it 'stores the transaction date' do
    date_now = Time.now
    transaction = Transaction.new(200, 'credit', 1000, date_now)
    expect(transaction.date).to eq date_now
  end

  it 'stores the transaction type' do
    transaction = Transaction.new(200, 'debit', 1000)
    expect(transaction.type).to eq 'debit'
  end

  it 'debits the account balance' do
    transaction = Transaction.new(200, 'debit', 1000)
    expect(transaction.current_balance).to eq 800
  end
end
