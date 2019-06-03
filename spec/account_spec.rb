require 'account'

describe 'Account' do
  it 'initialises with a balance of zero' do
    account = Account.new()
    expect(account.showBalance).to eq 0
  end
end
