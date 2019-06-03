# frozen_string_literal: true

require 'account'

describe 'show balance' do
  it 'initialised with a balance of zero' do
    account = Account.new
    expect(account.balance).to eq 0
  end
end
