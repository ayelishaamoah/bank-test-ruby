# frozen_string_literal: true

require 'account'

feature 'show balance' do
  scenario 'creating a new account with a balance of zero' do
    account = Account.new
    expect(account.show_balance).to eq 0
  end
end

# a user can deposit money into an account
feature 'create a new transaction' do
  scenario 'can deposit money into an account' do
    account = Account.new
    account.deposit(100)
    expect(account.show_balance).to eq 100
  end
end
