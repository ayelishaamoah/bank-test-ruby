require 'account'
require 'spec_helper'

feature 'show balance' do
  scenario 'creating a new account with a balance of zero' do
    account = Account.new()
    expect(account.showBalance).to eq 0
  end
end
