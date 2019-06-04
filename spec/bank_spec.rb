# frozen_string_literal: true

require 'bank'

describe Bank do
  subject { Bank.new }

  describe 'initialize' do
    it 'should be empty when the bank is initialized' do
      expect(subject.transactions).to eq []
    end

    it 'initialised with a balance of zero' do
      expect(subject.balance).to eq 0
    end
  end

  describe 'deposit' do
    it 'increased the balance by 100' do
      subject.deposit(100)
      expect(subject.balance).to eq 100
    end

    it 'stores deposits' do
      subject.deposit(100)
      transaction = subject.transactions.first
      expect(transaction.type).to eq 'credit'
    end
  end

  describe 'withdraw' do
    it 'decreases the balance by 20' do
      subject.deposit(100)
      subject.withdraw(20)
      expect(subject.balance).to eq 80
    end

    it 'stores withdrawals' do
      subject.deposit(200)
      subject.withdraw(100)
      transaction = subject.transactions.last
      expect(transaction.type).to eq 'debit'
    end
  end

  describe 'print statement' do
    it 'shows a formatted list of transactions' do
      subject.deposit(1000)
      subject.deposit(2000)
      subject.withdraw(500)

      expect { subject.print_statement }.to output(<<~PRINTOUT
        date       || credit    || debit     || balance
        04/06/2019 ||           || 500.00    || 2500.00
        04/06/2019 || 2000.00   ||           || 3000.00
        04/06/2019 || 1000.00   ||           || 1000.00
      PRINTOUT
      ).to_stdout
    end
  end
end
