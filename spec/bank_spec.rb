# frozen_string_literal: true

require 'bank'

describe Bank do
  subject { Bank.new }
  let(:statement) { double(:statement) }
  date = Time.now
  let(:deposit) { double(:transaction, date: date, amount: 500, type: 'credit', current_balance: 1500) }
  let(:credit) { double(:transaction, date: date, amount: 800, type: 'debit', current_balance: 2000) }

  describe 'deposit' do
    it 'increased the balance by 100' do
      allow(subject).to receive(:create_transaction).and_return(deposit)
      expect(subject.deposit(500)).to eq 1500
    end
  end

  describe 'withdraw' do
    it 'decreases the balance by 20' do
      allow(subject).to receive(:create_transaction).and_return(credit)
      expect(subject.withdraw(800)).to eq 2000
    end
  end

  describe 'print statement' do
    it 'shows a formatted list of transactions' do
      subject.deposit(200)
      subject.withdraw(100)
      expect(statement).to receive(:print_statement)
      subject.print_statement(statement)
    end
  end
end
