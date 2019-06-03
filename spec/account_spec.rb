# frozen_string_literal: true

require 'account'

describe Account do
  subject { Account.new }

  describe 'show balance' do
    it 'initialised with a balance of zero' do
      expect(subject.balance).to eq 0
    end
  end

  describe 'deposit' do
    it 'increased the balance by 100' do
      subject.deposit(100)
      expect(subject.balance).to eq 100
    end
  end

  describe 'withdraw' do
    it 'decreases the balance by 20' do
      subject.deposit(100)
      subject.withdraw(20)
      expect(subject.balance).to eq 80
    end
  end
end
