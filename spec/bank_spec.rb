# frozen_string_literal: true

require 'bank'

describe Bank do
  subject { Bank.new }
  let(:statement) { double(:statement) }

  describe 'deposit' do
    it 'increased the balance by 100' do
      expect(subject.deposit(100)).to eq 100
    end
  end

  describe 'withdraw' do
    it 'decreases the balance by 20' do
      subject.deposit(100)
      expect(subject.withdraw(20)).to eq 80
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
