# frozen_string_literal: true

require 'account'

describe 'show balance' do
  it 'initialised with a balance of zero' do
    account = Account.new
    expect(account.balance).to eq 0
  end
end

describe 'deposit' do
  it 'increased the balance by 100' do
    account = Account.new
    account.deposit(100)
    expect(account.balance).to eq 100
  end
end
