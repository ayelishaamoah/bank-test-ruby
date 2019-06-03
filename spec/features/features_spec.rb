# frozen_string_literal: true

require 'account'
require 'spec_helper'

describe 'Account' do
  subject { Account.new }

  feature 'show balance' do
    scenario 'creating a new account with a balance of zero' do
      expect(subject.show_balance).to eq 0
    end
  end

  # a user can deposit money into an account
  feature 'create a new transaction' do
    scenario 'can deposit money into an account' do
      subject.deposit(100)
      expect(subject.show_balance).to eq 100
    end
  end
end
