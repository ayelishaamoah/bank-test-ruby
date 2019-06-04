# frozen_string_literal: true

require 'statement'
require 'bank'

describe Statement do
  before(:each) do
    @bank = Bank.new
  end

  describe 'print statement' do
    it 'shows a formatted list of transactions' do
      @bank.deposit(1000)
      @bank.deposit(2000)
      @bank.withdraw(500)
      statement = described_class.new(@bank.transactions)

      expect { statement.print_statement }.to output(<<~PRINTOUT
        date       || credit    || debit     || balance
        04/06/2019 ||           || 500.00    || 2500.00
        04/06/2019 || 2000.00   ||           || 3000.00
        04/06/2019 || 1000.00   ||           || 1000.00
      PRINTOUT
      ).to_stdout
    end
  end
end
