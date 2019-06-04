# frozen_string_literal: true

require 'statement'

describe Statement do
  let(:subject) { Statement.new }
  date = Date.new(2019, 6, 4)
  let(:deposit) { double(:transaction, date: date, amount: 2000, type: 'credit', current_balance: 2000) }
  let(:credit) { double(:transaction, date: date, amount: 500, type: 'debit', current_balance: 1500) }

  let(:transactions) { [deposit, credit] }

  describe 'print statement' do
    it 'shows a formatted list of transactions' do
      expect { subject.print_statement(transactions) }.to output(<<~PRINTOUT
        date       || credit    || debit     || balance
        04/06/2019 ||           || 500.00    || 1500.00
        04/06/2019 || 2000.00   ||           || 2000.00
      PRINTOUT
      ).to_stdout
    end
  end
end
