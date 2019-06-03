# frozen_string_literal: true

require 'transaction'

describe Transaction do
  it 'stores the transaction amount' do
    transaction = Transaction.new(200)
    expect(transaction.amount).to eq 200
  end

  it 'stores the transaction date' do
    transaction = Transaction.new(200)
    date_now = Time.now
    allow(transaction).to receive(:date).and_return(date_now)
    expect(transaction.date).to eq date_now
  end
end
